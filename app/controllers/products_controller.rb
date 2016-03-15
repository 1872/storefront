class ProductsController < ApplicationController

def index
  @tacos = Product.all
  
end

def show
  @taco = Product.find_by(id: params[:id])
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
