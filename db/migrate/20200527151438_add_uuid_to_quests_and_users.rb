class AddUuidToQuestsAndUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :quests, :uuid, :string, default: ""
    add_column :users, :uuid, :string, default: ""    
  end
end
