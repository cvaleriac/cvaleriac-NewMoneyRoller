class RolloversController < ApplicationController

  before_action :authenticate_user!
  before_action :current_user
  

  def index

    if !is_logged_in?
      redirect_to '/'
    end
    if params[:institution_id] && institution = Institution.find_by_id(params[:institution_id])
      #nested route
      @rollovers = institution.rollovers.by_user(current_user).order_by_amount
    else
          @rollovers = current_user.rollovers.order_by_amount
        end
    end

  def incoming
   @rollovers = Rollover.incoming
  end

    
  def outgoing
    @rollovers = Rollover.outgoing
  end

  def show 
    @rollover = Rollover.find_by(id: params[:id])
  end

  def new
    #check if it's nested & it's a proper id
    if params[:institution_id] && institution = Institution.find_by_id(params[:institution_id])
      #nested route
      @rollover = institution.rollovers.build
    else
      #unnested
      @rollover = Rollover.new
      @rollover.build_institution
    end
  end

  def create
    @rollover = current_user.rollovers.build(rollover_params)
  
    if @rollover.rollover_type == "Incoming" && @rollover.save
        redirect_to incoming_path(@rollover)
    elsif @rollover.rollover_type == "Outgoing" && @rollover.save
      redirect_to outgoing_path(@rollover)
    else
      @rollover.build_institution
      render :new
  end
    
end

  def edit
    if params[:institution_id]
      institution = Institution.find_by(id: params[:institution_id])
      if institution.nil?
        redirect_to institutions_path, alert: "Institution not found."
      else
        @rollover = institution.rollovers.find_by(id: params[:id])
        redirect_to institution_rollovers_path(institution), alert: "Rollover not found." if @rollover.nil?
      end
    else
      @rollover = Rollover.find(params[:id])
    end
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