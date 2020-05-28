class AddUuidToQuests < ActiveRecord::Migration[5.1]
  def change
    add_column :quests, :uuid, :string, default: ""
  end
end
