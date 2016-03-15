class Product < ActiveRecord::Base
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
end
