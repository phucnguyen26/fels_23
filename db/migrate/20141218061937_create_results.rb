class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :category, index: true
      t.references :lesson, index: true
      t.references :word, index: true
      t.references :answer, index: true

      t.timestamps
    end
  end
end
