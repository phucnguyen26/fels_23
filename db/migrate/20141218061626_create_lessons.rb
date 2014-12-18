class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :result
      t.integer :number_words
      t.references :category, index: true

      t.timestamps
    end
  end
end
