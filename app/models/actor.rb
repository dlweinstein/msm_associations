class Actor < ApplicationRecord

  #   - name: must be present; must be unique in combination with dob
validates :name, :presence => true, :uniqueness => { :scope => :dob }

  # - dob: no rules
  # - bio: no rules
  # - image_url: no rules

  # Shortcut to find the ALL the CHARACTERS for an actor
  has_many :characters, :class_name => "Character", :foreign_key => "actor_id"

  # Shortcut to find the ALL the MOVIES for an actor
  has_many :movies, :class_name => "Movie", :foreign_key => "movie_id"

# "Through" many-to-many helper method
  has_many :characters
  has_many :movies, :through => :characters

end
