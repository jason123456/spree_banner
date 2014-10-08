Spree::Product.class_eval do
  has_many :banner_box_products, :dependent => :destroy
end
