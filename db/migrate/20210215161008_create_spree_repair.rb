class CreateSpreeRepair < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_repairs do |t|
      t.belongs_to :user
      t.integer :number
      t.string :phone
      t.text :comment
      t.integer :status
      t.timestamps
    end
  end
end
