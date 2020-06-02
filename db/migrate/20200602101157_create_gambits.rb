class CreateGambits < ActiveRecord::Migration[5.2]
  def change
    create_table :gambits do |t|
      t.text :text
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
