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
    end
  
    def create
    
      @rollover = current_user.rollovers.build(rollover_params)
      if @rollover.rollover_type == "incoming" && @rollover.save
          redirect_to show_path(@rollover)
      elsif @rollover.rollover_type == "outcoming" && @rollover.save
        redirect_to outgoing_path(@rollover)
      else
        render new_rollover_path(@rollover)
    end
  end

    def edit
      @rollover = Rollover.find(params[:id])
    end

    private

    def rollover_params
      params.require(:rollover).permit(:rollover_type, :origin_bank, :destination_bank, :amount)
    end
  
  end
            