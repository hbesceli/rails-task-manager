class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @completed_status = @task.completed? ? "complete" : "incomplete"
  end

  def new
    # This is where the form is rendered...
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to task_path(task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to task_path(task)
    # We don't want to render a page here
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :complete)
  end
end
