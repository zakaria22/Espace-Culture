class BooksController < ApplicationController
	before_action :find_book, only: [:show, :edit, :update, :destroy]
	
	def index
		if params[:category].blank?
			@books = Book.all 
		else
			@category_id = Bookcat.find_by(name: params[:category]).id
			@books = Book.where(:bookcat_id => @category_id)
		end
	end

	def new
		@book = current_user.books.build
		@categories = Bookcat.all.map{ |c| [c.name, c.id] }
	end

	def create
		@book = current_user.books.build(book_params)	
		@book.bookcat_id = params[:bookcat_id]
		if @book.save
			redirect_to books_path
		else
			render 'new'
		end	
	end

	def show
		if @book.reviews.blank?
			@average_review =0
		else
			@average_review = @book.reviews.average(:rating).round(2)
		end
	end

	def edit
		@categories = Bookcat.all.map{ |c| [c.name, c.id] }
	end

	def update
		@book.bookcat_id = params[:bookcat_id]
		if @book.update(book_params)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@book.destroy
		redirect_to books_path
	end
	
	private 
		def book_params
			params.require(:book).permit(:title, :description, :author, :bookcat_id, :book_img) 
		end

		def find_book
			@book = Book.find(params[:id])
		end	
end
