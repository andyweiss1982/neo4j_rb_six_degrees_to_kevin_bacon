class ActedIn
  include Neo4j::ActiveRel
  include Neo4j::Timestamps

  from_class  :Actor
  to_class    :Movie
  type 'acted_in'

  property :role, type: String

  validates_presence_of :role

  before_validation :standardize_role


  def standardize_role
    self.role = role.titleize.squish
  end

end
