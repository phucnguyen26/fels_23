class Result < ActiveRecord::Base
  before_save :update_lesson_correct
  belongs_to :user
  belongs_to :category
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer
  def update_lesson_correct
    if self.answer
      if self.answer.is_correct
        self.lesson.update_attributes(result: self.lesson.result + 1)
      end
    end
  end
end
