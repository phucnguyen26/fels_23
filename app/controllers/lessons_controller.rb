class LessonsController < ApplicationController
  def new
    @lesson = Lesson.new category_id: params[:category_id], result: 0, 
      number_words: 0, user_id: current_user.id
     if @lesson.save
      redirect_to new_lesson_result_path lesson_id: @lesson.id
     end
  end

  def show
    @lesson = Lesson.find params[:id]
    @results = @lesson.results
    @words = @lesson.words.paginate page: params[:page]
  end
  
  private
  def lesson_params
    params.require(:lesson).permit(:category_id, :result,:number_words)
  end
end