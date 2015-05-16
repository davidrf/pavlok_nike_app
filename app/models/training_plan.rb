class TrainingPlan < ActiveRecord::Base
  belongs_to :user
  has_one :tracker

  def self.check_commitments
    TrainingPlan.all.each do |training_plan|
      if training_plan.start_time < DateTime.now && training_plan.end_time > DateTime.now && !training_plan.run_completed
        strikes = training_plan.tracker.strike
        if strikes == 0
          puts "beep"
          training_plan.tracker.update(strike: strikes + 1)
        elsif strikes == 1
          puts "beep and vibrate"
          training_plan.tracker.update(strike: strikes + 1)
        elsif strikes == 2
          puts "shock"
          shock_level = training_plan.tracker.shock_level
          unless shock_level == 250
            shock_level += 50
          end
          training_plan.tracker.update(strike: 0, shock_level: shock_level)
        end
      end
    end
  end
end
