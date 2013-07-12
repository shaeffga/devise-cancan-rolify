class JimsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_complaint, except: [:index, :new, :create]

  def index
    @jims = Jim.all
  end

  def new
    @jim = Jim.new
  end

  def create
    @jim = Jim.new(params[:jim])
    if @jim.save
      redirect_to @jim, notice: "Jim you can now read whats wrong."
    else
      flash[:alert] = "Complaint has not been created."
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @jim.update_attributes(params[:jim])
      flash[:alert] = "Complaint has been updated."
      redirect_to jim_path
    else
      flash[:alert] = "Complaint has not been created."
      render :action => "edit"
    end
  end

  def destroy
    @jim.destroy
    flash[:alert] = "Complaint has been deleted."
    redirect_to jims_path
  end

  def find_complaint
    @jim = Jim.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The Complaint you were looking for could not be found."
      redirect_to jims_path
  end
end
