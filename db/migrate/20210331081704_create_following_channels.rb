class CreateFollowingChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :following_channels do |t|
      t.references :user, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      
      t.timestamps
    end
    add_index :following_channels, [:user_id, :channel_id], unique: true
  end
end
