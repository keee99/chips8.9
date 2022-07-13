class Movie < ActiveRecord::Base
  def movies_with_same_director
    puts director
    movies = director != nil ? Movie.where(director: director) : []
    
  end
end
