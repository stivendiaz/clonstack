class QuestionsController < ApplicationController
    def new
        @question =Question.new
      end
      def index
        @questions =Question.all
      end
      def create
        @question =Question.create(questions_params)
        @question[:user_id] = current_user[:id]
        @question.save
        redirect_to questions_path(@question)
        
      end
      def show
        @question  =Question.find(params[:id])
        @answer = Answer.new
        @comment = Comment.new
      end
    
      def destroy
        question =Question.find(params[:id])
        question.destroy
      
        redirect_to questions_path
      end
    
      def edit
        @question  =Question.find(params[:id])
      end
    
      def update
        @question =Question.find(params[:id])
        if @question.update(question_params)
          redirect_to question_path, notice: "Question reload!"
        else
          render :edit
        end
      end
        private
        def questions_params
          params.require(:question).permit(:title,:body)
        end
end
