class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :date
      t.boolean :priority
      t.boolean :done

      t.timestamps null: false
    end
  end
end
