class Lesson < ActiveRecord::Base
  after_save :create_word
  belongs_to :user
  belongs_to :category
  has_many :results
  has_many :words, through: :results
  has_many :answers, through: :results
  has_many :lesson_words
  has_many :words, through: :lesson_words

  def create_word
    words = Word.generate_random_word self.category_id
    words.each do |word|
    LessonWord.create lesson_id: id, word_id: word.id
    end
  end
end