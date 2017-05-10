class Movie < ApplicationRecord
  # - director_id: must be present
  validates :director_id, :presence => true

  # - title: must be present; must be unique in combination with year
  validates :title, :presence => true, :uniqueness => { :scope => :year }

  # - year: must be integer between 1870 and 2050
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 1870, less_than_or_equal_to: 2050 }

  # - duration: must be integer between 0 and 2764800
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2764800 }

  # - description: no rules
  # - image_url: no rules

  # SHORTCUT TO FIND THE DIRECTOR FOR A MOVIE

  # :director  - defines the method
  # :class_name => "Director" - when invoked on a movie, fetches a result from the Directors table
  #  :foreign_key => "director_id" - Use the value in the director_id column of the movie to query the directors table for a row.

  belongs_to :director, :class_name => "Director", :foreign_key => "director_id"

  # Shortcut to find the ALL the CHARACTERS for a MOVIE

  # :characters: Define a method called .characters for all movie objects.
  # :class_name => "Character": When someone invokes .characters on a movie, go fetch results from the Charcters table.
  # :foreign_key => "movie_id": Search for the movie's id in the movie_id column of the Characters table.

  has_many :characters, :class_name => "Character", :foreign_key => "movie_id"

  # Shortcut to find all the ACTORS for a movie
  has_many :actors, :class_name => "Actor", :foreign_key => "actor_id"

# "Through" many-to-many helper method
  has_many :characters
  has_many :actors, :through => :characters



end
