	class QuestionsController < ApplicationController

	def index
		@questions=Question.all.sort.reverse
	end

	def show
		@question= Question.find(params[:id])
		@answer=Answer.new

	end

	def new

		@question=Question.new
	end

	def votes
		question=Question.find(params[:id])
		question.voteup
		redirect_to question
	end

	def create
      @question= Question.new(question_params)
      @question.user = current_user
      
        if @question.save 
        	flash[:success]= 'La pregunta ha sido creada con exitó'
           redirect_to questions_path
        else
 	       render :new	
        end 
	end

	def edit
		@question=Question.find(params[:id])
	end

	def update
		@question=Question.find(params[:id])
		if @question.update(question_params)
			redirect_to questions_path, notice:'La pregunta fue editada con exito'
		else	
		   render 'edit'			
		end	
	end

	def destroy
		Question.find(params[:id]).destroy
		redirect_to questions_path, notice: 'La pregunta fue eliminada con exitó'
	end

	def voteup
		question=Question.find(params[:id])
		question.votes.create(user: current_user)
		redirect_to question_path
		
	end

	def delete_vote

		question=Question.find(params[:id])
		question.votes.where(user:current_user).take.try(:destroy)
		redirect_to question_path
	end
	

private

 def question_params
 	params.require(:question).permit(:title, :description)
 end



end
