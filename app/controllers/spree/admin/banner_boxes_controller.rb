module Spree
  module Admin
    class BannerBoxesController < ResourceController
      
      def index
        respond_with(@collection)
      end
      
      def show
        redirect_to( :action => :edit )
      end
      
      def update
        
        Spree::BannerBoxProduct.destroy_all(:banner_box_id => @banner_box.id)
        
        if !params[:banner_box_products].blank?
          params[:banner_box_products].split(",").each do |product|
            @banner_box_products = @banner_box.banner_box_products.new
            @banner_box_products.product_id = product
            @banner_box_products.save!
          end
        end
        
        @banner_box.enhance_settings
        
        super
      end

      def clone
        @new = @banner_box.duplicate

        if @new.save
          flash.notice = I18n.t('notice_messages.banner_box_cloned')
        else
          flash.notice = I18n.t('notice_messages.banner_box_not_cloned')
        end

        respond_with(@new) { |format| format.html { redirect_to edit_admin_banner_box_url(@new) } }
      end
      
      def find_promotion
        if params[:ids]
          @promotion = Spree::Activator.find(params[:ids])
        else
          @promotion = Spree::Activator.ransack(params[:q]).result
        end
        
        
        render :json => @promotion, :root => true
      end
      
      protected
      def find_resource
        Spree::BannerBox.find(params[:id])
      end
      
      def location_after_save
         edit_admin_banner_box_url(@banner_box)
      end
      
      def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:s] ||= "category, position asc"
        
        @search = super.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
      end
    end
  end
end
