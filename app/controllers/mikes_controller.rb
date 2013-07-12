class MikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_complaint, except: [:index, :new, :create]

  def index
    @mikes = Mike.all
  end

  def new
    @mike = Mike.new
  end

  def create
    @mike = Mike.new(params[:mike])
    if @mike.save
      redirect_to @mike, notice: "Mike you can now read whats wrong."
    else
      flash[:alert] = "Complaint has not been created."
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @mike.update_attributes(params[:mike])
      flash[:alert] = "Complaint has been updated."
      redirect_to mike_path
    else
      flash[:alert] = "Complaint has not been created."
      render :action => "edit"
    end
  end

  def destroy
    @mike.destroy
    flash[:alert] = "Complaint has been deleted."
    redirect_to mikes_path
  end

  def find_complaint
    @mike = Mike.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The Complaint you were looking for could not be found."
      redirect_to mikes_path
  end
end

