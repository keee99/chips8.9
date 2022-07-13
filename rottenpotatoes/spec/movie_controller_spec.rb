require 'rails_helper'

RSpec.describe "movie", type: :view do 
  before(:all) do 
    Movie.destroy_all
    Movie.create(:id => 1, :title => 'Alien', :rating => 'R', :release_date => '1979-05-25')
    Movie.create(:id => 2, :title => 'Alien 2', :rating => 'R', :director => "James Cameron", :release_date => '1979-05-25')
    Movie.create(:id => 3, :title => 'Star Wars', :rating => "PG", :director => "George Lucas", :release_date => '1979-05-25')
    Movie.create(:id => 4, :title => 'THX 1138', :rating => "PG", :director => "George Lucas", :release_date => '1979-05-25')
  end 
  after(:all) do
    Movie.destroy_all
  end


	describe "controller" do
		it "should show a movie" do
			movie = Movie.find_by(:title => "Alien")
      puts Movie.all
			visit movie_path(Movie.find_by(:title => "Alien"))	
			expect(page.current_path).to eq("/movies/1")
		end
    it "should create a movie" do
      visit new_movie_path(Movie.find_by(:title => "Alien"))
      fill_in 'Title', with: 'Titanic'
      click_button 'Save Changes'


  #     <%= label :movie, :title, 'Title', :class => 'col-form-label' %>
  # <%= text_field :movie, :title, :class => 'form-control' %>
  # <%= label :movie, :rating, 'Rating', :class => 'col-form-label'  %>
  # <%= select :movie, :rating, ['G','PG','PG-13','R','NC-17'], {}, {:class => 'form-control col-1'} %>
  # <%= label :movie, :release_date, 'Released On', :class => 'col-form-label'  %>
  # <%= date_select :movie, :release_date, {}, :class => 'form-control col-2 d-inline' %>
  # <br/>
  # <%= submit_tag 'Save Changes', :class => 'btn btn-primary' %>
  # <%= link_to 'Cancel', movies_path, :class => 'btn btn-secondary' %>

    end
	end





end