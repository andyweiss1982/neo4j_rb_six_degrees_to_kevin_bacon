class WorkedWith
  include Neo4j::ActiveRel
  include Neo4j::Timestamps

  from_class  :Actor
  to_class    :Actor
  type 'worked_with'

  property :movie, type: String

end
