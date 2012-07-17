class Book < ActiveRecord::Base
  attr_accessible :language, :title, :genre, :sales_in_millions

  belongs_to :publisher
  has_many   :collaborations
  has_many   :authors, through: :collaborations

  scope :thriller, lambda { where(genre: 'thriller') }
  scope :highest_grosser, lambda { where(sales_in_millions: maximum(:sales_in_millions)) }

  def self.genres
    select(:genre).uniq
  end
end
