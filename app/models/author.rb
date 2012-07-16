class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :collaborations
  has_many :books, through: :collaborations

  scope :as_editor, lambda { joins(:collaborations).merge(Collaboration.editor) }
  scope :as_writer, lambda { joins(:collaborations).merge(Collaboration.writer) }

  # merge association
  # this wont work if you removed scoped from the association
  def publishers
    Publisher.joins(books: { collaborations: :author }).merge(collaborations.scoped)
  end

  # usage except method on scope
  def publishers_worked_as_editor 
    publishers.merge(Author.as_editor.except(:joins))
  end

  def books_worked_as_editor
    books.merge(Author.as_editor.except(:joins))
  end

  # usage except method on only
  def publishers_worked_as_writer
    publishers.merge(Author.as_writer.only(:wheres))
  end

  def books_worked_as_writer
    books.merge(Author.as_writer.only(:wheres))
  end
end
