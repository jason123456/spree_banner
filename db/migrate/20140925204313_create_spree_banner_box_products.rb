class CreateSpreeBannerBoxProducts < ActiveRecord::Migration
  def change
    create_table :spree_banner_box_products do |t|
      t.integer :product_id
      t.integer :banner_box_id
      
      t.timestamps
    end
  end
end
