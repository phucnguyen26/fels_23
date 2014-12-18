class Result < ActiveRecord::Base
  belongs_to :category
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer
end
