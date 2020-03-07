class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
      t.string  :title, null: false
      t.text    :description
      t.boolean :stored, null: false, default: false
      t.boolean :quest_master_validation, null: false, default: false
      t.boolean :quest_hunter_completion, null: false, default: false

      t.references :quest_author, index: true, foreign_key: {to_table: 'users'}, null: false
      t.references :quest_hunter, index: true, foreign_key: {to_table: 'users'}
      t.timestamps
    end
  end
end
