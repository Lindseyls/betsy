class Category < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, presence: true

  CATEGORIES = %w(Home Bedding Health Grooming Toys Training Accessories Food)


  def self.new_category
    new_cat = self.new(name: params[:name])

    CATEGORIES << new_cat

    return CATEGORIES
  end

  def self.to_category_hash
    data = {}
    CATEGORIES.each do |cat|
      data[cat] = by_category(cat)
    end
    return data
  end

  def self.by_category(category)
    category = category.singularize.capitalize
    self.where(category: category)
  end

end
