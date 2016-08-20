class DailyReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_reports = current_user.daily_reports.order("daily")
  end

  def new
    @daily_report = current_user.daily_reports.build
  end

  def create
    @daily_report = current_user.daily_reports.build(daily_reports_params)
    if @daily_report.save
      flash[:notice] = "新增成功"
      redirect_to root_path
    else
      flash[:alert] = "新增失敗"
      redirect_to new_daily_report_path
    end
  end
  protected

  def set_daily
    @daily_report = DailyReport.find(params[:id])
  end

  def daily_reports_params
    params.require(:daily_report).permit(:content, :daily)
  end
end
