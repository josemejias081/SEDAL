class TestsController < ApplicationController
  load_and_authorize_resource
  def index
    if current_user.is_admin?
      @pagy, @tests = pagy(Test.all.order("created_at DESC"), items: 9) 
    else
      @pagy, @tests = pagy(current_user.evaluator_tests, items: 9)
    end
  end

  def new

    @scales = Scale.all
    @evaluation = Evaluation.find(params[:evaluation_id])
    @user = User.find(params[:user_id])
    @test = Test.new(evaluated_id: @user.id, evaluator_id: current_user.id, evaluation_id: @evaluation.id)    
    @evaluation.items.each do |item|
      @test.scores.build(item_id: item.id, description: item.description)
    end
  end

  def create
    @test = Test.new(test_params)
    @user = User.find(params[:test][:evaluated_id])
      if @test.save
        EvaluationMailer.notify(@user, @test).deliver_now!
        redirect_to test_path(@test.id)
      else
        render :new
      end
    end

    def edit
      @test = Test.find(params[:id])
    end
  
    def show
      @test = Test.find(params[:id])
      @score_sums = @test.scores.sum(:value)
      respond_to do |format|
        format.html
        format.pdf do
          @is_pdf = true
                render pdf: "Evaluation",
                page_size: 'Letter',
                template: "tests/show.html.erb",
                layout: "pdf.html.erb",
                lowquality: true,
                viewport_size: '1366x768',

                zoom: 1
        end
      end
    end
  
    private
  
    def test_params
      params.require(:test).permit(:evaluation_id, :evaluated_id, :evaluator_id, :user_id, 
                                  scores_attributes: [:item_id, :test_id, :id, :description, :value], 
                                  answer_attributes: [:item_id, :id, :description, :value],
                                  scale_attributes: [:item_id, :description, :value])
    end
  end


  
