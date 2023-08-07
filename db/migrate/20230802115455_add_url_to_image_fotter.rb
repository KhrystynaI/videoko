class AddUrlToImageFotter < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_image_footers, :url, :string
  end
end
