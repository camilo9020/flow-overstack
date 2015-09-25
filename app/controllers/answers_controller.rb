class AnswersController < ApplicationController

	def create
	    @question=Question.find(answer_params[:question_id])
	   	@answer=@question.answers.create(answer_params)
	   	redirect_to question_path(@question)
	end

  	def voteup
		answer=Answer.find(params[:id])
		puts "id: #{answer.id}"
		answer.votes.create(user: current_user)
		redirect_to question_path(answer.question)
	end


private
	def answer_params
		params.require(:answer).permit(:body, :question_id, :user_id)
	end
end
