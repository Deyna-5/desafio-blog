class PostsController < ApplicationController
       http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23', except: :index
       
       def index
              @posts = Post.all.order(created_at: :desc)
       end

       def new
              @post = Post.new
       end    

       def create
              @post = Post.new(post_params)
              contenido = @post.content
              contenido.gsub!("spoiler", "  ")
              @post.content = contenido
              if @post.save
                     redirect_to root_path, notice: "El post fue ingresado con éxito"
              else
                     redirect_to posts_dashboard_path, notice: "El post no se pudo ingresar, intente nuevamente"
              end  
       end

       private
              def post_params
                     params.require(:post).permit(:title, :content, :image_url)
              end
end