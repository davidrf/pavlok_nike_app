class TrainingPlansController < ApplicationController
  def index
    @user = current_user
    @training_plan = @user.training_plans.new
    @times = []
    year, month, day = Date.today.strftime('%Y %m %d').split
    time = Time.new(year.to_i, month.to_i, day.to_i)

    48.times do
      @times << time
      time += 1800
    end

    @times.map! {|e| [e.strftime('%H:%M'), e]}[0]
    @display_time = []
    @stored_time = []

    @times.each_with_index do |arr, index|
      @stored_time = @times[1]
    end

    @all_plans = @user.training_plans
  end

  def new

  end

  def create
    @user = current_user
    @training_plan = @user.training_plans.new(training_plans_params)
    if @training_plan.save
      @training_plan.tracker.new(strike: 0).save
      flash[:notice] = "New Plan Saved"
      redirect_to user_training_plans_path
    else
      flash[:errors] = @training_plan.errors
      render :new
    end
  end

  def edit

  end

  def update
    @user = current_user
    @all_plans = @user.training_plans

    plan_id = params[:id]
    @training_plan = TrainingPlan.find(plan_id)

    @training_plan.update_attributes(run_completed: true)

    if @training_plan.save
      flash[:notice] = "Good job!"
    else
      flash[:errors] = "Hmm.. something went wrong"
    end
      redirect_to root_path
  end


  private

  def training_plans_params
    params.require(:training_plan).permit(:plan_name, :start_time, :end_time)
  end
end
