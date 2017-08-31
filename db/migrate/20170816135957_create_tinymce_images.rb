class CreateTinymceImages < ActiveRecord::Migration
  def change
    create_table :tinymce_images do |t|
      t.string :alt
      t.string :hint
      t.string :file

      t.timestamps null: false
    end
  end
end
