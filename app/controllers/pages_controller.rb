class PagesController < ApplicationController
  def home
	  @title = "Home"
	  if signed_in?
	    @feed_items = Micropost.paginate(:page => params[:page])
    end
    @listings = Micropost.search(params[:search])
  end

  def contact
    @title = "Contact"
  end
  
  def about
	  @title = "About"
  end
  
  def help
    @title = "Help"
  end

  def listings
    @title = "Listings"
    @feed_items = Micropost.paginate(:page => params[:page])
    @listings = Micropost.search(params[:search])
  end
  
end
