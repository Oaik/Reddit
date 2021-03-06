class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body

      t.belongs_to :user, foreign_key: true
      t.belongs_to :channel, foreign_key: true

      t.timestamps
    end

  end
end
