class AnswersController < ApplicationController

	def create
	    @question=Question.find(answer_params[:question_id])
	   	@answer=@question.answers.new(answer_params)
	   	if @answer.save
	   		redirect_to question_path(@question)
	   	else
	   		render 'questions/show'
	   	end	
	end  

	def delete
		answer=Answer.find(params[:id])
		answer.votes.where(user:current_user).take.try(:destroy)
		redirect_to question_path(answer.question)
	end
	
  	def voteup
		answer=Answer.find(params[:id])
		answer.votes.create(user: current_user)
		redirect_to question_path(answer.question)
	end

private
	def answer_params
		params.require(:answer).permit(:body, :question_id, :user_id)
	end
end
