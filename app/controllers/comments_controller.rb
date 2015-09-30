class CommentsController < ApplicationController
	
	def create
		@question = Question.find(params[:comment][:commenter_id])
		@answer = Answer.find(params[:comment][:commenter_id])
		
		if params[:comment][:commenter_type] == "Question"
			@comment_question = @question.comments.new(comment_params)
			@comment_answer = @answer.comments.new
			if @comment_question.save
				redirect_to @comment_question.commenter
			else
				render  'questions/show'
			end
		else
			@comment_answer = @answer.comments.new(comment_params)
			@comment_question = @question.comments.new
			if @comment_answer.save
				redirect_to @comment_answer.commenter
			else
				render  'questions/show'
			end
		end
		
	end

	def show
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commenter_id, :commenter_type)		
	end	

end
