
class MoviesController < ApplicationController

  def index

    

    @movies = Movie.all
    @movies = @movies.where("upper(title) like upper(?)", "%#{params[:title]}%") if params[:title]
    @movies = @movies.where("upper(director) like upper(?)", "%#{params[:director]}%") if params[:director]
    @movies = @movies.where("runtime_in_minutes < 90") if params[:runtime_in_minutes].to_i < 90 
    @movies = @movies.where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120") if params[:runtime_in_minutes].to_i >= 90 && params[:runtime_in_minutes].to_i <= 120
    @movies = @movies.where("runtime_in_minutes > 120") if params[:runtime_in_minutes].to_i > 120



    # rim = params[:runtime_in_minutes].to_i
    # rim_conditional = nil
    # if rim < 90
    #   rim = "runtime_in_minutes < 90"
    # elsif rim > 90 && rim < 120
    #   rim_conditional = "runtime_in_minutes >= 90 and runtime_in_minutes <= 120"
    # else
    #   rim_conditional = "runtime_in_minutes > 120"
    # end

    # if rim_conditional
    #   @movies = @movies.where(rim_conditional)
    # end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :image, :description
    )
  end

end