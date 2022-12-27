class QuestionItemsController < ApplicationController
    
    before_action :set_topic


    def create
        @question_item = @topic.question_items.create(question_item_params)
        redirect_to @topic
    end

    def show
        @question_item = @topic.question_items
    end

    def destroy
        @question_item = @topic.question_items.find(params[:id])
        if @question_item.destroy
         flash[:success] = "Question item was deleted."
        else
         flash[:error] = "Question item could not be deleted."
        end
        redirect_to @topic
    end


    private
    
    def set_topic
        @topic = Topic.find(params[:topic_id])
    end

    def question_item_params
        params[:question_item].permit(:content)
    end

end

