class CreatePinsTags < ActiveRecord::Migration
  def change
    create_table :pins_tags, :id =>false do |t|
      t.references  :pin, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
