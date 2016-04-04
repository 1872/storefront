class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :run_search]

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
    if params[:category]
      @tacos = Category.find_by(name: params[:category]).products
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
    @taco = Product.new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    @suppliers = Supplier.all
    @taco = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      rating: params[:rating],
      supplier_id: params[:supplier][:supplier_id]
    )
    if @taco.save
      @image = Image.new(src: params[:image_url], product_id: @taco.id)
      if @image.save
        flash[:success] = "Taco made!"
        redirect_to "/products/#{@taco.id}"
      else
        render "new.html.erb"
      end
    else
      render "new.html.erb"
    end
  end

  def edit
    @taco = Product.find_by(id: params[:id])
  end

  def update
    @taco = Product.find_by(id: params[:id])
    if @taco.update(name: params[:name], price: params[:price], description: params[:description], rating: params[:rating])
      flash[:success] = "This taco has been updated!"
      redirect_to "/products/#{@taco.id}"
    else
      render "edit.html.erb"
    end
  end

  def destroy
    @taco = Product.find_by(id: params[:id])
    @taco.destroy
    flash[:warning] = "Taco destroyed!"
    redirect_to "/"
  end

  def run_search
    search_term = params[:search]
    @tacos = Product.where("name LIKE ?", "%" + search_term + "%")
    render "index.html.erb"
  end

  private
  
  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
end
