class ActedIn
  include Neo4j::ActiveRel
  include Neo4j::Timestamps

  from_class  :Actor
  to_class    :Movie
  type 'acted_in'

  property :role, type: String

  validates_presence_of :role

  before_validation :standardize_role
  after_create :create_worked_withs

  def standardize_role
    self.role = role.titleize.squish
  end

  def create_worked_withs
    movie.actors_excluding(actor).each do |coworker|
      puts WorkedWith.create(from_node: actor, to_node: coworker, movie: movie.title)
      puts WorkedWith.create(from_node: coworker, to_node: actor, movie: movie.title)
    end
  end

  def actor
    self.from_node
  end

  def movie
    self.to_node
  end

end
