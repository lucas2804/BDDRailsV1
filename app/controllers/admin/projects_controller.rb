module Admin
  class Admin::ProjectsController < Admin::ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    # GET /admin/projects
    def index
      @projects = ::Project.all
    end

    # GET /admin/projects/1
    def show
      authorize @project, :show?
    end

    # GET /admin/projects/new
    def new
      @project = ::Project.new
    end

    # GET /admin/projects/1/edit
    def edit
    end

    # POST /admin/projects
    def create
      @project = ::Project.new(project_params)
      if @project.save
        redirect_to [:admin, @project], notice: 'Project was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/projects/1
    def update
      if @project.update(project_params)
        redirect_to [:admin, @project], notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/projects/1
    def destroy
      @project.destroy
      redirect_to admin_projects_url, notice: 'Project was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = ::Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to admin_projects_path
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :description, :id)
    end
  end
end
