#
 # Variants helper functions 
 #
 # @author:
 # 
 # @version: 1.1
 #
 # @notes: 
 #
#

module VariantsHelper
  
  # Return the min price of all the variants of a product
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


  # Return the max price of all the variants of a product
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
