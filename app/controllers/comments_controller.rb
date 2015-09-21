class CommentsController < ApplicationController


	
	def create
		@comment=Comment.create(comment_params)
		if @comment.commenter_type == 'Question'
			redirect_to @comment.commenter
		elsif  @comment.commenter_type == 'Answer'
			redirect_to question_path(@comment.commenter.question, anchor: "answer_#{@comment.commenter.id}")
		end
	end

	


	def show
		
		
	end

private

def comment_params
	params.require(:comment).permit(:body, :commenter_id, :commenter_type)		
end	

end
