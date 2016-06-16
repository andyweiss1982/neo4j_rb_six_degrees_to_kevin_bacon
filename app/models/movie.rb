class Movie
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :title, type: String, constraint: :unique

  validates :title, presence: true, uniqueness: true
  before_validation :standardize_title

  has_many :in, :actors, rel_class: :ActedIn

  def standardize_title
    self.title = title.titleize.squish
  end

  def actors_excluding(actor)
    actors(:a).where('a.uuid <> {actor_uuid}').params(actor_uuid: actor.uuid)
  end

end
