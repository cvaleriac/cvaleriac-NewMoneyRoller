class InstitutionsController < ApplicationController

    before_action :authenticate_user!

    def index
       @institutions = Institution.order_by_name 
    end

    def show
      @institution = Institution.find(params[:id])
    end

    def new
      @institution = Institution.new
    end
  
    def create
    
      @institution = Institution.new(institution_params)
      if @institution.save
          redirect_to institution_path(@institution)

      else
        render new_institution_path(@institution)
    end
  end

  def edit
    @institution = Institution.find(params[:id])
  end

  def update
    @institution = Institution.find(params[:id])
    if @institution.update(institution_params)
      redirect_to institution_path(@institution)
    else
      flash[:notice] = "something went wrong"
      redirect_to edit_institution_path(@institution)
    end
  end

  private
  def institution_params
    params.require(:institution).permit(:name, :address, :file_type)
  end

end
