class AnswersController < ApplicationController

 def create
    @question=Question.find(answer_params[:question_id])
   	@answer=Answer.create(answer_params)
   	redirect_to question_path(@question)
  end


private
	def answer_params
		params.require(:answer).permit(:body, :question_id)
	end
end
