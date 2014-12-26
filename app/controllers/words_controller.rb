class WordsController < ApplicationController
  def index
    @categories = Category.all
    if params[:category_id]
      category_id = params[:category_id]
      @category = Category.find category_id
      @choice = params[:choice] || "all"
      case @choice
        when "all"
          @words = @category.words
        when "learned"
          @words = Word.word_learneds current_user.id, category_id
        else
          @words = Word.word_not_learneds current_user.id, category_id
      end
    else
      @words = Word.all
    end
  end
end