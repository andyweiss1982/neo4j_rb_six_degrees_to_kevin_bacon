class Actor
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :name, type: String, constraint: :unique

  validates :name, presence: true, uniqueness: true

  before_validation :standardize_name

  has_many :out, :movies, rel_class: :ActedIn
  has_many :out, :coworkers, rel_class: :WorkedWith, model_class: :Actor, unique: true

  def standardize_name
    self.name = name.titleize.squish
  end

end
