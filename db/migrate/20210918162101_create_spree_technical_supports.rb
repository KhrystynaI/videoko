class CreateSpreeTechnicalSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_technical_supports do |t|
      t.text :body
      t.timestamps
    end
  end
end
