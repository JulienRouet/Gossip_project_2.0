class PagesController < ApplicationController
  
  def home    
    @gossips = Gossip.all
    @users = User.all
  end

  def welcome
    @name = params[:name]
  end

  def contact    
  end

  def team    
  end

  def gossip
    @gossips = Gossip.all
    @users = User.all

  end

    def author
    @gossips = Gossip.all
    @users = User.all
  end

end
