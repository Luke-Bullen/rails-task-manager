class TasksController < ApplicationController
  # gives the tasks the set task method - makes @task = Task.find(params[:id])
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # dont need a create.html.erb so just redirect back to the created task page
    redirect_to task_path(@task)
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    # dont need a update.html.erb so just redirect back to the task page
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    # dont need a destroy.html.erb so just redirect back to index page
    redirect_to index_path, status: :see_other
    # status: :see_other responds with a 303 HTTP status code
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
