class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
      @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))


    if @question.save

      flash[:notice] = "Your question was saved."
      redirect_to @question
    else

      flash.now[:alret] = "There was an error posting your question. Please try again"
      render :new
    end
  end


  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
   if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash[:error] = "There was an error updating you question. Please try again."
      render :edit
    end
  end

  def destroy
     @question = Question.find(params[:id])


     if @question.destroy
       flash[:notice] = "\"#{@question.title}\" was deleted successfully."
       redirect_to question_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

end
