class Topics::QuestionsController < ApplicationController
  before_action :set_topic
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    ##@questions = Question.all
    @questions = @topic.questions
  end

  # GET /questions/1 or /questions/1.json
  def show
    @answers = @question.answers
  end

  # GET /questions/new
  def new
    @question = @topic.questions.build
    # @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = @topic.questions.build(question_params)
    # @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@topic], notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@topic, @question], notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to [@topic, :questions], notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      # @question = Question.find(params[:id])
      @question = @topic.questions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content)
    end
end
