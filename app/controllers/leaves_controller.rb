class LeavesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_leave, only: [:show, :edit, :update, :show]

  def index
    @leaves = current_user.leave

  end

  def new
    @leafe = Leave.new
  end

  def create
    @leafe = current_user.leave.build(leave_params)
    if @leafe.save
      flash[:notice] = "申請成功"
      redirect_to leafe_path(@leafe)
    else
      flash[:alert] = "申請失敗"
      redirect_to new_leafe_path
    end
  end

  def edit
  end

  def update
    if @leafe.update(leave_params)
      flash[:notice] = "更新成功"
      redirect_to leafe_path(@leafe)
    else
      flash[:alert] = "更新失敗"
      redirect_to edit_leafe_path
    end
  end

  protected

  def set_leave
    @leafe = Leave.find(params[:id])
  end

  def leave_params
    params.require(:leave).permit(:leave_time_start, :leave_time_end, :leave_class, :leave_subject)
  end
end
