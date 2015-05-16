class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.integer :strike, null: false
      t.integer :shock_level, default: 150
      t.integer :training_plan_id, null: false

      t.timestamps null: false
    end
  end
end
