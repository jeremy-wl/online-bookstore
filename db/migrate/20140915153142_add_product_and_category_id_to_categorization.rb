class AddProductAndCategoryIdToCategorization < ActiveRecord::Migration
  def change
    add_column :categorizations, :category_id, :integer
    add_column :categorizations, :product_id, :integer
  end
end
