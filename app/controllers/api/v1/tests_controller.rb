module API
  class V1::TestsController < API::ApplicationController
    before_action :set_admin_test, only: [:show, :edit, :update, :destroy]
    respond_to :json
    # GET /admin/tests
    # GET /admin/tests.json
    def index
      @admin_tests = ::Test.all
      render json: @admin_tests
    end

    # GET /admin/tests/1
    # GET /admin/tests/1.json
    def show
      render json: @admin_test
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_test
      @admin_test = ::Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_test_params
      params.require(:test).permit(:name, :description, :id,
                                   questions_attributes: [:name, :description, :id, :_destroy,
                                                          answers_attributes: [:id, :name, :is_correct_answer, :_destroy]]
      )
    end
  end
end
