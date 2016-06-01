class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.references :user

      t.timestamps null: false
  end
end
