class RolloversController < ApplicationController

    before_action :authenticate_user

    def Index
        @rollovers = Rollover.all
    end


    def new
      @rollover = Rollover.new
    end
  
    def create
      @rollover = Rollover.new(rollover_params)
        if @rollover.save
          redirect_to @rollover
        else
            render :new
    end
  
  end                