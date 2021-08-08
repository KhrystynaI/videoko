class AddTranslateToPost < SpreeExtension::Migration[4.2]
  def up
    params = { title: :string, body: :string }
      Spree::Post.create_translation_table!(params, { migrate_data: true })
  end

  def down
    Spree::Post.drop_translation_table! migrate_data: true
  end
end
