class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end
  
  def show
    @task = Task.find_by(id: params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task=Task.new(task: params[:task])
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
end
