require 'rails_helper'

RSpec.describe "views with directors", type: :view do 
  before(:all) do 
    Movie.create(:title => 'Alien', :rating => 'R', :release_date => '1979-05-25')
  end 
	describe "when editing details of a movie" do
		it "should show director input form" do
			movie = Movie.find_by(:title => "Alien")
			visit edit_movie_path(Movie.find_by(:title => "Alien"))	
			expect(page).to have_field("movie_director")
		end
	end
end