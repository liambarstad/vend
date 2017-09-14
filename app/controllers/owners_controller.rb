class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(name: params[:owner][:name])
    if @owner.save
      flash[:notice] = "New Owner #{@owner.name} Created"
      redirect_to root_path
    else
      flash[:notice] = "Name must be filled out"
      redirect_to new_owner_path
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if params[:owner][:name]
      @owner.update(name: params[:owner][:name])
      flash[:notice] = "Owner Updated"
      redirect_to owner_path(@owner)
    else
      flash[:notice] = "Name must be valid"
      redirect_to edit_owner_path(@owner)
    end
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    flash[:notice] = "Owner Deleted"
    redirect_to owners_path
  end

end
