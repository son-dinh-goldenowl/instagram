class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :caption, null: false, default: ''
      t.string :photo

      t.timestamps
    end
  end
end
