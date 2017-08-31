class CreateTriviaKnows < ActiveRecord::Migration
  def change
    create_table :trivia_knows do |t|
      t.text :title
      t.text :content
      t.belongs_to :recipe_blog, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
