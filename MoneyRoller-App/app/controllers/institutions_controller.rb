class InstitutionsController < ApplicationController

    before_action :authenticate_user!
    before_action :current_user

    def index
       @institutions = current_user.institutions.order_by_name.uniq
      respond_to do |f|
        f.html
        f.json {render json: @institutions}
      end
    end

    def show
        @institution = Institution.find(params[:id])
        respond_to do |f|
        f.html
        f.json {render json: @institutions}
        
    end
  end

    def new
      @institution = Institution.new
    end
  
    def create
    
      @institution = current_user.institutions.build(institution_params)
      if @institution.save
          render json: @institution
          #redirect_to institution_path(@institution)

      else
        render new_institution_path(@institution)
    end
  end


  private
  def institution_params
    params.require(:institution).permit(:name, :address, :file_type)
  end 


end
