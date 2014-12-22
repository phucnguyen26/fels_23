class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
  has_many :results
  scope :generate_random_word, ->(category_id) do
    where(category_id: category_id).order("RAND()").limit 20
  end
end