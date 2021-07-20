class WorksController < ApplicationController
  def index
    @work = Work.all.order("created_at DESC")
    @channel = Channel.find(params[:channel_id])
    @works = @channel.works.includes(:user)
  end

  def new
    @work = Work.new
    @channel = Channel.find(params[:channel_id])
    @add_form = @work.add_forms.build
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

  def show
    @work = Work.find(params[:id])
    @add_forms = @work.add_forms.includes(:work)
  end

  private
  def work_params
    params.require(:work).permit(
      :date, :process_name,add_forms_attributes: [:id, :work_id,:production_name, :serial_number, :start_time, :ending_time, :forgetting, :problem, :_destroy])
      .merge(user_id: current_user.id)
  end

end



