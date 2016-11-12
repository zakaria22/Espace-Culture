class MoviesController < ApplicationController
	before_action :find_movie, only: [:show, :edit, :update, :destroy]
	
	def index
		if params[:category].blank?
			@movies = Movie.all 
		else
			@category_id = Moviecat.find_by(name: params[:category]).id
			@movies = Movie.where(:moviecat_id => @category_id)
		end
	end

	def new
		@movie = current_user.movies.build
		@categories = Moviecat.all.map{ |c| [c.name, c.id] }
	end

	def create
		@movie = current_user.movies.build(movie_params)	
		@movie.moviecat_id = params[:moviecat_id]
		if @movie.save
			redirect_to movies_path
		else
			render 'new'
		end	
	end

	def show
		if @movie.comments.blank?
			@average_review =0
		else
			@average_review = @movie.comments.average(:rating).round(2)
		end
	end

	def edit
		@categories = Moviecat.all.map{ |c| [c.name, c.id] }
	end

	def update
		@movie.moviecat_id = params[:moviecat_id]
		if @movie.update(movie_params)
			redirect_to movie_path(@movie)
		else
			render 'edit'
		end
	end

	def destroy
		@movie.destroy
		redirect_to movies_path
	end

	private 
		def movie_params
			params.require(:movie).permit(:title, :description, :actors, :mes, :bd, :moviecat_id, :movie_img) 
		end

		def find_movie
			@movie = Movie.find(params[:id])
		end	
end
