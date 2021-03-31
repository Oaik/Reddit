class CreateVotePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :vote_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.boolean :isUpVote

      t.timestamps
    end
    add_index :vote_posts, [:user_id, :post_id], unique: true
  end
end
