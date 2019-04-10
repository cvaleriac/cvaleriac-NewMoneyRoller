class RolloversController < ApplicationController

    before_action :authenticate_user!

    def Index
       @rollovers = Rollover.current_user
    end

    def show
      @rollover = Rollover.find_by(rollover_type: params[:rollover_type])
    end

      
    def outgoing
      @rollover = Rollover.find_by(rollover_type: params[:rollover_type])
    end


    def new
      @rollover = Rollover.new
      @institution = @rollover.build_institution
    end
  
    def create
    
      @rollover = current_user.rollovers.build(rollover_params)
    
      if @rollover.rollover_type == "Incoming" && @rollover.save
          redirect_to show_path(@rollover)
      elsif @rollover.rollover_type == "Outgoing" && @rollover.save
        redirect_to outgoing_path(@rollover)
      else
        render :new
    end
  end

    def edit
      @rollover = Rollover.find(params[:id])
    end

    private

    def rollover_params
      params.require(:rollover).permit(:rollover_type, :origin, :destination_bank, :amount, :institution_id, institution_attributes:[:name, :address, :file_type])
    end
  
  end
            