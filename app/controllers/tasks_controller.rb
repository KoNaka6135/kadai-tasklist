class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task  = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = '新規タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = '新規タスクは投稿されませんでした'
      render :new
    end
  end

  def edit
     @task  = Task.find(params[:id])
  end

  def update
  end

  def destroy
  end
end

  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end