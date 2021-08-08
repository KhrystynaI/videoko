class ChangePostBody < SpreeExtension::Migration[4.2]
  def self.up
    change_column :spree_posts, :body, :text
  end

  def self.down
    change_column :spree_posts, :body, :string 
  end
end
