module Admin
  class Admin::ProjectsController < Admin::ApplicationController
    before_action :set_admin_project, only: [:show, :edit, :update, :destroy]

    # GET /admin/projects
    def index
      @admin_projects = ::Project.all
    end

    # GET /admin/projects/1
    def show
    end

    # GET /admin/projects/new
    def new
      @admin_project = ::Project.new
    end

    # GET /admin/projects/1/edit
    def edit
    end

    # POST /admin/projects
    def create
      @admin_project = ::Project.new(admin_project_params)

      if @admin_project.save
        redirect_to [:admin, @admin_project], notice: 'Project was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/projects/1
    def update
      if @admin_project.update(admin_project_params)
        redirect_to [:admin, @admin_project], notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/projects/1
    def destroy
      @admin_project.destroy
      redirect_to admin_projects_url, notice: 'Project was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_project
      @admin_project = ::Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to admin_projects_path
    end

    # Only allow a trusted parameter "white list" through.
    def admin_project_params
      params.require(:project).permit(:name, :description, :id)
    end
  end
end
