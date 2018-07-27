class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(user_id: @current_user.id, task_id: params[:task_id])
    @like.save
    redirect_to("/tasks/#{params[:task_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, task_id: params[:task_id])
    @like.destroy
    redirect_to("/tasks/#{params[:task_id]}")
  end
end
