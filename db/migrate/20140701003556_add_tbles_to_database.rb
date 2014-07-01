class AddTblesToDatabase < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :user_name, null: false
      t.string :url, null: false
      t.integer :points

      t.timestamps

      t.index :user_name, unique: true
    end

    create_table :comments do |t|
      t.text :text_box, null: false
      t.belongs_to :article, index: true
    end
  end
end
