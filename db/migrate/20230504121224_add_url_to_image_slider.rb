class AddUrlToImageSlider < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_image_sliders, :url, :string
  end
end
