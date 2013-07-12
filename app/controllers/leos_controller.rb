class LeosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_complaint, except: [:index, :new, :create]

  def index
    @leos = Leo.all
  end

  def new
    @leo = Leo.new
  end

  def create
    @leo = Leo.new(params[:leo])
    if @leo.save
      redirect_to @leo, notice: "Leo you can now read whats wrong."
    else
      flash[:alert] = "Complaint has not been created."
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @leo.update_attributes(params[:leo])
      flash[:alert] = "Complaint has been updated."
      redirect_to leo_path
    else
      flash[:alert] = "Complaint has not been created."
      render :action => "edit"
    end
  end

  def destroy
    @leo.destroy
    flash[:alert] = "Complaint has been deleted."
    redirect_to leos_path
  end

  def find_complaint
    @leo = Leo.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The Complaint you were looking for could not be found."
      redirect_to leos_path
  end
end
