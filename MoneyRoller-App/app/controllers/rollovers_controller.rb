class RolloversController < ApplicationController

    before_action :authenticate_user!

    def Index
       @rollovers = Rollover.all
    end

    def show
      @rollovers = Rollover.find_by(id: params[:id])
    end


    def new
      @rollover = Rollover.new
    end
  
    def create
      rollover = Rollover.create(rollover_params)
      redirect_to rollover_path(rollover)
    end
  
    def edit
      @rollover = Rollover.find(params[:id])
    end

    private

    def rollover_params
      params.require(:rollover).permit(:rollover_type, :origin_bank,
                                        :destination_bank, :amount)
    end
  
  end
               