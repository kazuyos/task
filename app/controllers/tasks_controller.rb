class TasksController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def index
    @tasks = Task.all.order(created_at: :desc)
  end
  
  def show
    @task = Task.find_by(id: params[:id])
    @user = User.find_by(id: @task.user_id)
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task=Task.new(task: params[:task],
                  user_id: @current_user.id)
    if @task.save
      redirect_to('/tasks/index')
    else
      render('/tasks/new')
    end
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
  end
  
  def update
    @task = Task.find_by(id: params[:id])
    @task.task = params[:task]
    
    if @task.save
      redirect_to("/tasks/index")
      flash[:notice] = "保存できました"
    else
      redirect_to("/tasks/#{@task.id}/edit")
    end
  end
  
  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to('/tasks/index')
  end
  
  def ensure_correct_user
    @task = Task.find_by(id: params[:id])
    if @task.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/tasks/index")
    end
  end
end
