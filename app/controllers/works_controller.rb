class WorksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  before_action :set_channel
  before_action :user_check, only: [:edit, :update, :destroy]



  def index
    @work = Work.all.order("created_at DESC")
    @works = @channel.works.includes(:user)
  end

  def new
    @work = Work.new
    @add_form = @work.add_forms.build
  end
  
  def create
    @work = @channel.works.new(work_params)
    if @work.save
      redirect_to channel_works_path(@channel)
    else
      @works = @channel.works.includes(:user)
      render :new
    end
  end

  def show
    @works = @channel.works.includes(:user)
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to channel_works_path(@channel.id)
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to root_path
  end



  private
  def work_params
    params.require(:work).permit(
      :date, :process_name,add_forms_attributes: [:id, :work_id,:production_name, :serial_number, :start_time, :ending_time, :forgetting, :problem, :_destroy])
      .merge(user_id: current_user.id)
  end

  def set_work
    @work = Work.find(params[:id])
    @add_forms = @work.add_forms.includes(:work)
  end

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def user_check
    unless @work.user_id == current_user.id
      redirect_to root_path
    end
  end

end




