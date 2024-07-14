class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]

  def index
    @pagy, @tasks = pagy(Task.all)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :subtitle, :due_date, :priority)
  end
end
