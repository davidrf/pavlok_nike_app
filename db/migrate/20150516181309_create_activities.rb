class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
    	t.string :nike_activity_id, null: false
    	t.integer :calories
    	t.float :distance
    	t.integer :duration
    end
  end
end
