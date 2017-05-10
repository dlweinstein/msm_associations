class Director < ApplicationRecord

  # - name: must be present; must be unique in combination with dob
validates :name, :presence => true, :uniqueness => { :scope => :dob }
  # - dob: no rules

  # - bio: no rules

  # - image_url: no rules


# FIND ALL THE MOVIES FOR A DIRECTOR

# :movies: Define a method called .movies for all director objects.
# :class_name => "Movie": When someone invokes .movies on a director, go fetch results from the Movies table.
# :foreign_key => "director_id": Search for the director's id in the director_id column of the Movies table.

  has_many :movies, :class_name => "Movie", :foreign_key => "director_id"

end
