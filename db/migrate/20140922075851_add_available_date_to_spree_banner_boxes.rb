class AddAvailableDateToSpreeBannerBoxes < ActiveRecord::Migration
  def change
    add_column :spree_banner_boxes, :available_on, :datetime
    add_column :spree_banner_boxes, :available_off, :datetime
  end
end
