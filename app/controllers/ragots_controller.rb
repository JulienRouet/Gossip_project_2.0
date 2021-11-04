class RagotsController < ApplicationController

  def new  
  end
  
  def create
    @ragot = Gossip.new(title: params[:title], content: params[:content], user_id: User.find_by(first_name: 'arnaudnimous').id)
    puts "$" * 60
    puts params
    puts "$" * 60
    if @ragot.save
      redirect_to root_path, notice: "Gossip crée, t'es une grosse poucave"
    else
      flash.now[:alert] = "mauvaises entrees de formulaire"
      render "ragots/new" 
    end
  end

  def show 
    @gossips = Gossip.find(params[:id])
    @author = User.find(@gossips.user_id)
    @comments = []
    Comment.where(gossip_id: @gossips.id).order(:id).reverse.each do |comment|
      @comments << [comment, User.find(comment.user_id).first_name, User.find(comment.user_id).last_name]
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title].capitalize, content: params[:content], user_id: User.find_by(first_name: 'arnaudnimous').id)
      redirect_to root_path, notice: 'Mise a jour effectuée'
    else
      flash.now[:alert] = 'Erreur, veuillez verifier le formulaire'
      render :edit
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @gossips << @gossip
   end 
  

  def destroy
    if Gossip.find(params[:id]).destroy
      redirect_to root_path, notice: 'Gossip supprimé'
    else
      flash.now[:alert] = 'Erreur, veuillez réessayer'
      render :edit
    end
  end
end


