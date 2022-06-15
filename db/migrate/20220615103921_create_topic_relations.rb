class CreateTopicRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :topic_relations do |t|
      t.integer :follower_topic_id
      t.integer :topic_added_id

      t.timestamps
    end
    add_index :topic_relations, :follower_topic_id
    add_index :topic_relations, :topic_added_id
    add_index :topic_relations, [:follower_topic_id, :topic_added_id], unique: true
  end
end
