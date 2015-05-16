class CreateTrainingPlans < ActiveRecord::Migration
  def change
    create_table :training_plans do |t|
      t.string :plan_name, null: false
      t.float :speed
      t.integer :user_id, null: false
    end
  end
end
