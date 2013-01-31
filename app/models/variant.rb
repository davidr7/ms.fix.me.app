class Variant < ActiveRecord::Base
  attr_accessible :bay, :description, :price, :product_id, :sku, :stock_level_reserved, :stock_level_total, :weight_in_grams

  belongs_to :product

  def buyable?
  	stock_level_available > 0
  end

  def stock_level_available
  	stock_level_total - stock_level_reserved
  end
  
  def min_variant_price(variant)
    variants = Variant.where("product_id = ?", variant.product_id)
    min = variant.price
    variants.each do |v|
      if (v.price < variant.price)
        min = v.price
      end
    end
    min
  end
  
  def max_variant_price(variant)
    variants = Variant.where("product_id = ?", variant.product_id)
    max = variant.price
    variants.each do |v|
      if (v.price > variant.price)
        max = v.price
      end
    end
    max
  end

end
