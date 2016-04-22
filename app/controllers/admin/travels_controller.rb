class Admin::TravelsController < ApplicationController
  before_action :admin_user

  def index
    @travels = Travel.all
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to admin_travels_path, notice: "New travel subject was successfully created"
    else
      render :new
    end
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def update
    @travel = Travel.find(params[:id])

    respond_to do |format|
      if @travel.update(travel_params)
        format.html { redirect_to admin_travels_path, notice: 'Travel was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy

    redirect_to admin_travels_path, notice: 'Travel was successfully destroyed'
  end

  private

  def admin_user
    redirect_to(root_path, flash: {warning: 'You are not authorized for the job'}) unless current_user && current_user.admin?
  end

  def travel_params
    params.require(:travel).permit(:name)
  end
end
