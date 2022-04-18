class BooksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
# 如果出現例外訊息就做not_found方法

    def index
        @books=Book.all
    end
    def new
       @book=Book.new
    end
    def create
        @book=Book.new(clean_params)
        if @book.save
            flash[:notice]= "新增成功"
            redirect_to books_path
            
        else 
            flash[:notice]= "資料有誤"
            render :new
        end
    end
    def show
        @book=Book.find(params[:id])
    end

    def edit
        @book=Book.find(params[:id])
    end

    def update
        @book=Book.find(params[:id])
        if @book.update(clean_params)
            redirect_to books_path,notice:"資料已更新完成！！"
        else 
            render :edit
         end
    end

    def destroy
        @book=Book.find(params[:id])
        @book.destroy
        redirect_to books_path ,notice:"已刪除"
    end

    


    private
    def clean_params
        params[:book].permit(:name,:date,:price,:pages,:ISBN)
    end


    def not_found
        # render html:"再試試看ㄌ"
        render file: "#{Rails.root}/public/404.html",
        status:404,layout:false
    end
end