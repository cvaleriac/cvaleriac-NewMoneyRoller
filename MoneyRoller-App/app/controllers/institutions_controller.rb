class InstitutionsController < ApplicationController

    before_action :authenticate_user!
    before_action :current_user

    def index
       @institutions = current_user.institutions.order_by_name.uniq
    end

    def show
        @institution = Institution.find(params[:id])
    end

    def new
      @institution = Institution.new
    end
  
    def create
    
      @institution = current_user.institutions.build(institution_params)
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

  def destroy
    @institution = Institution.find(params[:id]) 
    @institution.destroy
    flash[:notice] = "Rollover deleted"
    redirect_to institutions_path
  end

  private
  def institution_params
    params.require(:institution).permit(:name, :address, :file_type)
  end 


end
