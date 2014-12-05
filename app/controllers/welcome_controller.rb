class WelcomeController < ApplicationController
  def index
  end

  def create
    user = User.login(params[:session][:user_id], params[:session][:password])
    if user
      login user
      redirect_to welcome_mainmenu_path
    else
      flash[:notice] = "User does not exist!"
      redirect_to root_url
    end
  end

  def select
    shop = Shop.find_by_shop_no(current_user.shop_no)
    logger.debug "shop: #{ shop.id}"
    link = Link.find_by_name(params[:link_name])
    logger.debug "link: #{link.name}"
    if link.name == "location"
      @locations = shop.locations.all
    else if link.name == "genre"
        @genres = shop.genres.all
      else
        @publishers = shop.publishers.all
      end
    end
  end

  def product
    
    shop = Shop.find_by_shop_no(current_user.shop_no)
    @title = params[:link_to]
    logger.debug "shop: #{shop.id}"
    if location = Location.find_by_location_name(params[:link_to])
      logger.debug "location: #{location}"
      @books = location.books.where(:shop_id => shop.id)
    else if genre = Genre.find_by_genre_name_and_shop_id(params[:link_to],shop.id)
        logger.debug "genre: #{genre}"
        @books = genre.books.where(:shop_id => shop.id)
      else if publisher = Publisher.find_by_publisher_name_and_shop_id(params[:link_to],shop.id)
          logger.debug "publisher: #{publisher}"
          @books = publisher.books.where(:shop_id => shop.id)
        else
          @books = shop.books.all
        end
      end
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
