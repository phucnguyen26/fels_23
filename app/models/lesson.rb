class Lesson < ActiveRecord::Base
  after_create :create_activity
  after_save :create_word
  belongs_to :user
  belongs_to :category
  has_many :results
  has_many :words, through: :results
  has_many :answers, through: :results
  has_many :lesson_words
  has_many :words, through: :lesson_words
  has_many :activities
  
  def create_activity
    Activity.create(user_id: user_id, lesson_id: id, finished_at: Time.zone.now)
  end

  def create_word
    words = Word.generate_random_word self.category_id
    words.each do |word|
    LessonWord.create lesson_id: id, word_id: word.id
    end
  end
end