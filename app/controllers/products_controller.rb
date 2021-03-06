class ProductsController < ApplicationController

  before_action :authorize, only: [:new, :edit, :destroy]
# before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
    @usa_products = Product.buy_usa
    @three_most_recent = Product.three_most_recent
    @most_reviews = Product.most_reviews
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  # def ==(product_to_compare)
  #   if product_to_compare != nil
  #     self.name() == product_to_compare.title()
  #   else
  #     false
  #   end
  # end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
