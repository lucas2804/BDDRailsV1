module API
  class V1::TestResultsController < API::ApplicationController
    before_action :set_test_result, only: [:show, :edit, :update, :destroy]
    respond_to :json
    # POST /admin/tests
    # POST /admin/tests.json
    def create
      test_result = ::TestResult.new(test_result_params)
      test_result.user_id = @current_user.id
      if test_result.save
        render json: test_result, status: 201
      else
        render json: { errors: test_result.errors }, status: 422
      end
    end

    # PATCH/PUT /admin/tests/1
    # PATCH/PUT /admin/tests/1.json
    def update
      if @test_result.update test_result_params
        render json: @test_result, status: 201
      else
        render json: { errors: @test_result.errors }, status: 422
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_result
      @test_result = ::TestResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_result_params
      params.require(:test_result).permit(:user_id, :test_id, :question_id, :answer_id)
    end
  end
end
