module Spree
  class BannerBoxProduct < ActiveRecord::Base
    belongs_to :banner_box
    belongs_to :product
  end
end