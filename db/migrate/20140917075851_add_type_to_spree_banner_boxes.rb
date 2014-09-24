class AddTypeToSpreeBannerBoxes < ActiveRecord::Migration
  def change
    add_column :spree_banner_boxes, :banner_type, :string
  end
end
