class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page]
    @lesson = Lesson.new
  end
  
  private
  def categorie_params
    params.require(:category).permit(:name, :description)    
  end
end