class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.build

    @testimage = ProductImage.find(1)
  end

  def create
    @product = Product.new(params_int(product_params))
    respond_to do |format|
      if @product.save
        params[:product_image][:image].each do |image|
          @product.product_images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        @product.product_images.build
        format.html{render action:'new'}
      end
    end
  end

  def show
  end

  private
  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end

  def params_int(model_params)
    model_params.each do |key, value|
      if integer_string?(value)
        model_params[key] = value.to_i
      end
    end
  end

  def product_params
    # userはまだ入っていない
    params.require(:product).permit(:name, :text, :category_index_id ,:fresh_status,product_image_attributes:[:image], delivery_attributes:[:delivery_way, :fee_person, :from_area, :sending_day], price_attributes:[:benefit, :fee, :sell])
  end

  def image_params
    params.require(@image).permit(:image)
  end

  def price_params
    params.require(@price).permit(:benefit, :fee, :sell)
  end

  def delivery_params
    params.require(@delivery).permit(:deliver_way, :fee_person, :from_area, :sending_day)
  end

  def brand_params
    params.require(@brand).permit(:name)
  end

end

