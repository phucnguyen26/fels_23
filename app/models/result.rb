class Result < ActiveRecord::Base
  before_save :update_lesson_correct
  after_save :update_activity
  belongs_to :user
  belongs_to :category
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer
  def update_lesson_correct
    if self.answer
      self.lesson.update_attributes(number_words: self.lesson.number_words + 1)
      if self.answer.is_correct
        self.lesson.update_attributes(result: self.lesson.result + 1)
      end
    end
  end

  def update_activity
    Activity.create(user_id: self.lesson.user_id, lesson_id: self.lesson.id, finished_at: Time.zone.now)
  end
end
