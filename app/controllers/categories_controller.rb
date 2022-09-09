class CategoriesController < ApplicationController
    before_action :require_admin, except: [:show, :index]
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
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
        @articles = @category.articles
    end

    def edit

    end

    def update
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
   
    def destroy
        @category.destroy
        redirect_to @category
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

    def set_category
        @category = Category.find(params[:id])
    end
    
    def require_same_user
        if current_user != @user && !current_user.admin?
          flash[:alert] = "You can only edit or delete your own account"
          redirect_to @category
        end
    end


end