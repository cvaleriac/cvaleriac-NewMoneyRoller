class InstitutionsController < ApplicationController

    before_action :authenticate_user!

    def Index
       @institutions = Institution.all 
    end

    def show
      @institution = Institution.find_by(institution_id: params[:institution_id])
    end

    def new
      @institution = Institution.new
    end
  
    def create
    
      @institution = institutions.build(institution_params)
      if @institution.save
          redirect_to show_path(@institution)

      else
        render new_institution_path(@institution)
    end
  end

  private
  def institution_params
    params.require(:institution).permit(:name, :address, :file_type)
  end

end
