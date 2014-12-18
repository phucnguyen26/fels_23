class LessonWordRelationship < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
end
