class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def new
    @machine = Machine.new
  end

  def create
    owner = Owner.find_or_create_by(name: machine_params[:owner])
    @machine = Machine.new(name: machine_params[:name], location: machine_params[:location])
    @machine.owner = owner
    if @machine.save
      flash[:notice] = "New Machine #{@machine.name} Created for Owner #{owner.name}"
      redirect_to machine_path(@machine)
    else
      flash[:notice] = "Invalid input"
      redirect_to new_machine_path
    end
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def update
    owner = Owner.find_or_create_by(name: machine_params[:owner])
    @machine = Machine.find(params[:id])
    if owner
      @machine.owner = owner
    end
    if @machine.update(name: machine_params[:name], location: machine_params[:location])
      flash[:notice] = "#{@machine.name} Updated"
      redirect_to machine_path(@machine)
    else
      flash[:notice] = "Invalid input"
      redirect_to edit_machine_path(@machine)
    end
  end

  def destroy
    @machine = Machine.find(params[:id])
    @owner = @machine.owner
    @machine.destroy
    redirect_to owner_machines_path(@owner)
  end

  private

  def machine_params
    params[:machine]
  end
end
