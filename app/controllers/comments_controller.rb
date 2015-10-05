class CommentsController < ApplicationController
	
	def create		
		@comment=Comment.create(comment_params)		
		if @comment.commenter_type == 'Question'
			@answer = Answer.find(params[:comment][:commenter_id])
			redirect_to @comment.commenter		
		elsif  @comment.commenter_type == 'Answer'		
			redirect_to question_path(@comment.commenter.question)
		end
	end
			
				

							
		# if params[:comment][:commenter_type] == "Question"
		# 	@comment_question = @question.comments.new(comment_params)
		# 	@comment_answer = @answer.comments.new
		# 	if @comment_question.save
		# 		redirect_to @comment_question.commenter
		# 	else
		# 		render  'questions/show'
		# 	end
		# else
		# 	@comment_answer = @answer.comments.new(comment_params)
		# 	@comment_question = @question.comments.new
		# 	if @comment_answer.save
		# 		redirect_to @comment_answer.commenter
		# 	else
		# 		render  'questions/show'
		# 	end
		# end
		
	

	def show
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commenter_id, :commenter_type)		
	end	


	def find_commenter
	 
 	end


end
