class Character < ApplicationRecord
  # - movie_id: must be present
  validates :movie_id, :presence => true

  # - actor_id: must be present
  validates :actor_id, :presence => true
  # - name: no rules

  # Shortcut to find the Movie for a Character
  belongs_to :movie, :class_name => "Movie", :foreign_key => "movie_id"

  # Shortcut to find the Actor for a Character
  belongs_to :actor, :class_name => "Actor", :foreign_key => "actor_id"

end
