class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy finish]

  def index
    @pagy, @tasks = pagy(Task.order_recently.unfinished)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    unless @task.save
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      render @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
  end

  def finish
    @task.update!(finished: true)
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :subtitle, :due_date, :priority)
  end
end
