class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.datetime :finished_at
      t.references :user, index: true
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
