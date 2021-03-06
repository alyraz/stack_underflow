class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title,         :null => false
      t.text    :body,          :null => false
      t.integer :user_id,       :null => false
      t.integer :winner_id

      t.timestamps
    end
  end
end
