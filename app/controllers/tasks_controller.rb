class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update)
  def index
    @tasks = Task.all.order(created_at: :DESC)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(get_task_params)
    @task.save
    redirect_to tasks_path
  end

  def show
  end

  def edit
  end

  def update
    @task.update(get_task_params)
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def get_task_params
    params.require(:task).permit(:content,:detail)
  end
end
