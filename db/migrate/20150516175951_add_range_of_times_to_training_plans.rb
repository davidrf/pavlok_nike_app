class AddRangeOfTimesToTrainingPlans < ActiveRecord::Migration
  def change
    add_column :training_plans, :start_time, :datetime, null: false
    add_column :training_plans, :end_time, :datetime, null: false
    add_column :training_plans, :run_completed, :boolean, default: false
  end
end
