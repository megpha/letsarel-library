class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :collaborations
  has_many :books, through: :collaborations

  scope :editor, lambda { joins(:collaborations).merge(Collaboration.editor) }
  scope :writer, lambda { joins(:collaborations).merge(Collaboration.writer) }

  scope :thrillers, lambda { joins(collaborations: :book).merge(Book.thriller) }

  # or query
  def self.by_name(name)
    name = "%#{ name }%"
    predicate = arel_table[:first_name].matches(name).or(arel_table[:last_name].matches(name))

    where(predicate)
  end

  # subquery
  def self.non_thrillers
    idattr = arel_table[:id]
    subquery = thrillers.select(idattr)

    where(idattr.not_in(subquery.arel.ast))
  end

  # merge association
  # this wont work if you removed scoped from the association
  def publishers
    Publisher.joins(books: { collaborations: :author }).merge(collaborations.scoped)
  end

  # usage except method on scope
  def publishers_worked_as_editor 
    publishers.merge(Author.editor.except(:joins))
  end

  def books_worked_as_editor
    books.merge(Author.editor.except(:joins))
  end

  # usage except method on only
  def publishers_worked_as_writer
    publishers.merge(Author.writer.only(:wheres))
  end

  def books_worked_as_writer
    books.merge(Author.writer.only(:wheres))
  end
end
