class ResultsController < ApplicationController
  def new
    @result = Result.new
    @lesson = Lesson.find params[:lesson_id]
    lesson_word = next_question @lesson

    if lesson_word.present?
      @word = Word.find lesson_word
      @answers = @word.answers
    else
      redirect_to lesson_path @lesson
    end
  end

  def create
    @result = Result.new result_params
    lesson = Lesson.find params[:lesson_id]
    
    @result.lesson_id = lesson.id
    @result.user_id = current_user.id
    @result.category_id = lesson.category_id

    if @result.save
      redirect_to :back
    else
      render "new"
    end
  end

  private
  def result_params
    params.require(:result).permit(:category_id, :lesson_id, :word_id)
  end

  def next_question lesson
    lesson_words = lesson.lesson_words
    results = lesson.results

    if !results.present?
      return lesson_words.first.word_id
    end
    question_ids = Array.new
    result_ids = Array.new

    lesson_words.each do |lesson_word|
    question_ids.push(lesson_word.word_id)
    end

    results.each do |result|
    result_ids.push(result.word_id)
    end
    (question_ids - result_ids).first
  end
end