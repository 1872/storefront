class ProductsController < ApplicationController
  def index
    @tacos = Product.all
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    if sort_attribute && sort_order
      @tacos = Product.order(sort_attribute => sort_order)
    end
    if params["discount"]
      @tacos = Product.where("price < ?", 100)
    end
  end

  def show
    if params[:id] == "random"
      tacos = Product.all
      @taco = tacos.sample
    else
      @taco = Product.find_by(id: params[:id])
    end
  end

  def new
  end

  def create
    @taco = Product.create(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description], rating: params[:rating])
    flash[:success] = "Taco made!"
    redirect_to "/products/#{@taco.id}"
  end

  def edit
    @taco = Product.find_by(id: params[:id])
  end

  def update
    @taco = Product.find_by(id: params[:id])
    @taco.update(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description], rating: params[:rating])
    flash[:success] = "This taco has been updated!"
    redirect_to "/products/#{@taco.id}"
  end

  def destroy
    @taco = Product.find_by(id: params[:id])
    @taco.destroy
    flash[:warning] = "Taco destroyed!"
    redirect_to "/"
  end
end
