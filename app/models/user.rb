class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  def has_vote_for(voteable)
    voteable.votes.find_by(user_id: id)
  end

  def has_down_vote_for(down_voteable)
    down_voteable.down_votes.find_by(user_id: id)
  end

end
