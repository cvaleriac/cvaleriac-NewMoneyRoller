class RolloversController < ApplicationController

  before_action :authenticate_user!
  

  def index
    if params[:institution_id]
      @rollovers = Institution.find(params[:institution_id]).rollovers
    else
      @rollovers = current_user.rollovers
    end
    
  end

  def incoming
    @rollover = Rollover.find_by(id: params[:id])
  end

    
  def outgoing
    @rollover = Rollover.find_by(id: params[:id])
  end


  def new
    @rollover = Rollover.new
    @institution = @rollover.build_institution
  end

  def create
  
    @rollover = current_user.rollovers.build(rollover_params)
  
    if @rollover.rollover_type == "Incoming" && @rollover.save
        redirect_to incoming_path(@rollover)
    elsif @rollover.rollover_type == "Outgoing" && @rollover.save
      redirect_to outgoing_path(@rollover)
    else
      render :new
  end
end

  def edit
    @rollover = Rollover.find(params[:id])
  end

  def update
    @rollover = Rollover.find(params[:id])
    if @rollover.update(rollover_params) && @rollover.rollover_type == "Incoming"
      redirect_to incoming_path(@rollover)
  elsif @rollover.rollover_type == "Outgoing"
    redirect_to outgoing_path(@rollover)
    else
      flash[:notice] = "something went wrong"
      redirect_to edit_rollover_path(@rollover)
    end
  end

  def destroy
    @rollover = Rollover.find(params[:id]) 
    @rollover.destroy
    flash[:notice] = "Rollover deleted"
    redirect_to rollovers_path
  end

  private

  def rollover_params
    params.require(:rollover).permit(:rollover_type, :origin, :amount, :institution_id, institution_attributes:[:name, :address, :file_type])
  end

end