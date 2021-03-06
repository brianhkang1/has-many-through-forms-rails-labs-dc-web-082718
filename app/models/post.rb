class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def commentors
    self.comments.map do |c|
      c.user
    end.uniq
  end

  def category_names
    self.categories.map do |c|
      c.name
    end
  end

end
