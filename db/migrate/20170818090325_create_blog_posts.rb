class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
       t.text :title
       t.text :b_description
       t.text :content
      t.timestamps
    end
  end
end
