class Product < ActiveRecord::Base
  attr_accessible :description, :meta_description, :meta_keywords, :name, :published_status, :strapline, :subcode, :url_segment, :selected

  has_many :variants
  has_many :user

  has_and_belongs_to_many :categories

  acts_as_publishable

  # Return a limited number of random products
  def self.random_best_sellers(number)
  	find(:all, :limit => number, :order => 'RAND()')
  end

  # Return a list of products ordered by the selected order
  def self.list_of_products(selected_order = 'RAND()')
    find(:all, :order => selected_order)
  end

end
