class Collaboration < ActiveRecord::Base
  belongs_to :book
  belongs_to :author

  attr_accessible :role, :author_id

  scope :editor, lambda { where(role: 'editor') }
  scope :writer, lambda { where(role: 'writer') }
end
