class CreateLessonWordRelationships < ActiveRecord::Migration
  def change
    create_table :lesson_word_relationships do |t|
      t.references :lesson, index: true
      t.references :word, index: true

      t.timestamps
    end
  end
end
