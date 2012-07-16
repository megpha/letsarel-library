class Book < ActiveRecord::Base
  attr_accessible :language, :title, :genre

  belongs_to :publisher
  has_many   :collaborations
  has_many   :authors, through: :collaborations

  scope :thriller, lambda { where(genre: 'thriller') }
end
