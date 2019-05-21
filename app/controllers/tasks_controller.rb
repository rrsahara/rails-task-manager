class TasksController < ApplicationController
  # =>  TODO: As a user I should be able to:
  # As a user, I can list tasks
  # As a user, I can view the details of a task
  # As a user, I can add a new task
  # As a user, I can edit a task (mark as completed / update title & details)
  # As a user, I can remove a task
  def index
    @tasks = Task.all
  end

  def show
    # view the details of all the task
    @task = Task.find(params[:id])
  end

  def new
    # create a new instance of task
    @task = Task.new
  end

  def create
    # new_task = Task.new({title: params[:title], details: params[:details]})
    @tasks = Task.new(task_params)
    # raise
    @task.save
    redirect_to(tasks_path)
  end

  def edit
    # edit a task
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to(task_path(params[:id]))
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(tasks_path)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
