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
	

private

 def question_params
 	params.require(:question).permit(:title, :description)
 end



end
