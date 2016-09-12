module Admin
  class TicketsController < ApplicationController
    before_action :set_project, only: [:new, :create, :show, :edit, :update, :destroy]# Have to place :set_project before :set_admin_ticket
    before_action :set_admin_ticket, only: [:show, :edit, :update, :destroy]

    # GET /admin/tickets
    def index
      @admin_tickets = ::Ticket.all
    end

    # GET /admin/tickets/1
    def show
    end

    # GET /admin/tickets/new
    def new
      @ticket = @project.tickets.build
    end

    # GET /admin/tickets/1/edit
    def edit
    end

    # POST /admin/tickets
    def create
      @ticket = @project.tickets.build(admin_ticket_params)
      if @ticket.save
        redirect_to [:admin, @project], notice: 'Ticket was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/tickets/1
    def update
      if @ticket.update(admin_ticket_params)
        redirect_to [:admin, @project], notice: 'Ticket was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/tickets/1
    def destroy
      @ticket.destroy
      redirect_to admin_project_url(@project), notice: 'Ticket was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_ticket
      @ticket = @project.tickets.find(params[:id])
    end

    def set_project
      @project = ::Project.find(params[:project_id])
    end
    # Only allow a trusted parameter "white list" through.
    def admin_ticket_params
      params.require(:ticket).permit(:name, :description, :project_id)
    end
  end
end
