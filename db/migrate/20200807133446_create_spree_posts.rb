class CreateSpreePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_posts do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
