class WorksController < ApplicationController
  def index
    @work = Work.all
    @channel = Channel.find(params[:channel_id])
    @works = @channel.works.includes(:user)
  end

  def new
    @work = Work.new
    @channel = Channel.find(params[:channel_id])
    @time_study = @work.time_studies.build
  end
  
  def create
    @channel = Channel.find(params[:channel_id])
    @work = @channel.works.new(work_params)
    if @work.save
      redirect_to channel_works_path(@channel)
    else
      @works = @channel.works.includes(:user)
      render :new
    end
  end

  private
  def work_params
    params.require(:work).permit(:date, :process_name,
      time_studies_attributes: [:id, :work_id,:production_name, :serial_number, :start_time, :ending_time, :forgetting, :problem, :_destroy])
      .merge(user_id: current_user.id)
  end

end



