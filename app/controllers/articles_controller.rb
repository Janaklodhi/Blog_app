class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # def show
  #   begin
  #     @article = Article.find(params[:id])
  #   rescue ActiveRecord::RecordNotFound => e
  #     flash[:alert] = "Article not found."
  #     redirect_to articles_path
  #   rescue => e
  #     flash[:alert] = "Something went wrong: #{e.message}"
  #     redirect_to root_path
  #   end
  # end


  # def show
  #   # Attempt to fetch the article from cache, if not found, query the database
  #   @article = Rails.cache.fetch("article_#{params[:id]}", expires_in: 1.hours) do
  #     # If cache is not found, this block will be executed and the result will be cached
  #     Article.find(params[:id])
  #   end
  #   # If the article is not found in the cache or database, handle the exception
  #   rescue ActiveRecord::RecordNotFound => e
  #     flash[:alert] = "Article not found."
  #     redirect_to articles_path
  #   rescue => e
  #     flash[:alert] = "Something went wrong: #{e.message}"
  #     redirect_to root_path
  # end


  def show
    benchmark_result = Benchmark.measure do
      @article = Rails.cache.fetch("article_#{params[:id]}", expires_in: 12.hours) do
        Article.find(params[:id])
      end
    end
    Rails.logger.info "Cache and DB fetch time: #{benchmark_result}"
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def article_params
    params.require(:comment).permit(:commenter, :body)
  end
end