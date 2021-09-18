class CreateSpreeAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_abouts do |t|
      t.text :body
      t.timestamps
    end
  end
end
