class CreateIngrediantsTags < ActiveRecord::Migration
  def change
    create_table :ingrediants_tags, :id =>false do |t|
      t.references :ingrediant, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
