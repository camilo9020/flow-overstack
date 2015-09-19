class CommentController < ApplicationController


	def create
    	@question=Question.find(params[:id])
		@comment=@question.comment.create(comment_params)
		redirect_to question_comment_path(@question)
	end

private

def comment_params

	params.require(:question).permit(:body)		
end	



end
