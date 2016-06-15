class Actor
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :name, type: String, constraint: :unique

  validates :name, presence: true, uniqueness: true

  before_validation :standardize_name

  def standardize_name
    self.name = name.titleize.squish
  end

end
