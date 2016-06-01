class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer, null: false
      t.boolean :best_answer, default: false
      t.references :user, null: false
      t.references :question, null: false

      t.timestamps null: false
    end
  end
end
