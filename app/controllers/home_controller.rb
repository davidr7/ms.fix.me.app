class HomeController < ShopController

	def home
		@products = Product.public_viewable.random_best_sellers(20)
	  @chunk = Chunk.find(:all)
  end

  def save_text_chunk
  end

end
