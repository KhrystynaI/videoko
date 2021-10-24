class CreateSpreeImageFooters < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_image_footers do |t|
      t.integer :number
      t.timestamps
    end
  end
end
