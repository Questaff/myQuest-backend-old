class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
      t.string  :title, null: false
      t.text    :description
      t.integer :quest_author_id, null: false
      t.integer :quest_hunter_id
      t.boolean :stored, null: false, default: false
      t.boolean :quest_master_validation, null: false, default: false
      t.boolean :quest_hunter_completion, null: false, default: false

      t.references: :quest_author_id, index: true, foreign_key:true
      t.references: :quest_hunter_id, index: true, foreign_key:true
      t.timestamps
    end
  end
end
