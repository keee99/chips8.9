require 'rails_helper'

RSpec.describe "similar with directors", type: :view do 
  before(:all) do 
    Movie.create(:title => 'Alien', :rating => 'R', :release_date => '1979-05-25')
    Movie.create(:title => 'Alien 2', :rating => 'R', :director => "James Cameron", :release_date => '1979-05-25')
    Movie.create(:title => 'Star Wars', :rating => "PG", :director => "George Lucas", :release_date => '1979-05-25')
    Movie.create(:title => 'THX 1138', :rating => "PG", :director => "George Lucas", :release_date => '1979-05-25')
  end 

	describe "when editing details of a movie" do
		it "should show director input form" do
			movie = Movie.find_by(:title => "Alien")
			visit find_similar_movie_path(Movie.find_by(:title => "Alien"))	
			expect(page).to have_field("movie_director")
		end
	end

  # part 2
  describe "when visiting Similar movies" do
    it "should redirect to show if no movies" do
      movie = Movie.find_by(:title => "Star Wars")
      visit find_similar_movie_path(Movie.find_by(:title => "Alien"))	
			expect(page.current_path).to eq("/movies")
    end

    it "should redirect to show if no movies" do
      movie = Movie.find_by(:title => "Star Wars")
      visit find_similar_movie_path(Movie.find_by(:title => "Alien"))	
			expect(page.current_path).to eq("/movies")
    end
  end

  describe "When the movies instance method movies_with_same_director is called" do
    it "should return all movies with same directors" do
      movie = Movie.find_by(:title => "Star Wars")
      movies = movie.movies_with_same_director
      expect(movies.length).to eq(2)
    end
    it "should return empty list if no director" do
      movie = Movie.find_by(:title => "Alien")
      movies = movie.movies_with_same_director
      expect(movies.length).to eq(0)
    end
  end

end