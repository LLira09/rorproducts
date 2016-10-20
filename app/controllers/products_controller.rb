class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments
  end

  def new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    category = Category.find(products_params[:category])
    product = Product.new(name: products_params[:name], category: category, description: products_params[:description], pricing: products_params[:pricing])
    if product.save
      redirect_to :root
    else
      flash[:errors] = product.errors.full_messages
      redirect_to "/products/new"
    end
  end

  def update
    category = Category.find(products_params[:category])
    product = Product.find(params[:id])
    product.update(name: products_params[:name], description: products_params[:description], pricing: products_params[:pricing], category: category)
    redirect_to :root
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to :root
  end
  private
  def products_params
    params.require(:product).permit(:name, :description, :pricing, :category)
  end
end
