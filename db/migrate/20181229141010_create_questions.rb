class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.text :answers
      t.string :correct_answer
      t.integer :chapter
      t.integer :module
      t.boolean :contains_image
      t.integer :attempts, default: 0
      t.integer :successes, default: 0

      t.timestamps
    end
  end
end
