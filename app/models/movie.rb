class Movie
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :title, type: String, constraint: :unique

  validates :title, presence: true, uniqueness: true
  before_validation :standardize_title

  def standardize_title
    self.title = title.titleize.squish
  end

end
