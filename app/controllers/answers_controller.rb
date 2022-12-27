class AnswersController < ApplicationController
    
    before_action :set_topic
    before_action :set_question_item

    def create
        @answer = @question_item.answers.create(answer_params)
    end

    def show
        @answers = @question_item.answers
    end

    def destroy
        @answer = @question_item.answers.find(params[:id])
        if @answer.destroy
            flash[:success] = "Answer was deleted."
        else
             flash[:error] = "Answer could not be deleted."
        end
        redirect_to @topic
    end


    private

    def set_topic
        @topic = Topic.find(parmas[:topic_id])
    end

    def set_question_item
        @question_item = QuestionItem.find(params[:question_item_id])
    end

    def answer_params
        params[:answer].permit(:content)
    end

    

end

