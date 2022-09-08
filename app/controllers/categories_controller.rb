class CategoriesController < ApplicationController
    before_action :require_admin, except: [:show, :index]
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category was created successfully."
            redirect_to @category
        else
            render 'new', status: 422
        end
    end
    
    def show
        @category = Category.find(params[:id])
        @articles = @category.articles
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:notice] = "Category name updated successfully"
            redirect_to @category
        else
            render 'edit'
        end
    end

    def index
        @categories = Category.all
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admin can perform that action"
            redirect_to categories_path
        end
    end


end