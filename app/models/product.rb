class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: true

  def sale_message
    if price < 100
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def printable_category_names
    # names = []
    # categories.each do |category|
    #   names << category.name
    # end
    # names.join(", ")
    names = categories.map { |category| category.name }.join(", ")
  end
end
