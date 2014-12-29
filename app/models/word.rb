class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
  has_many :results
  scope :generate_random_word, ->(category_id) do
    where(category_id: category_id).order("RAND()").limit 2
  end
  scope :word_learneds, ->(user_id, category_id) do

    word_ids = Result.select("word_id").where(user_id: user_id).to_sql
    where("id IN (#{word_ids}) AND category_id = ?", category_id)
  end

  scope :word_not_learneds, ->(user_id, category_id) do

    word_ids = Result.select("word_id").where(user_id: user_id).to_sql
    where("id NOT IN (#{word_ids}) AND category_id = ?", category_id)
  end
end