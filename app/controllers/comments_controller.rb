class CommentsController < ApplicationController
  def new
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def create
    @gossip = Gossip.find(params[:ragot_id])
    @comment = Comment.new(content: params[:content], user: User.find_by(first_name: 'arnaudnimous'), gossip: @gossip)
    if @comment.save
      redirect_to ragot_path(@gossip.id), notice: 'commentaire ajouté'
    else
      redirect_to ragot_path(@gossip.id), alert: 'Erreur, veuillez verifier le formulaire'
    end
  end

  def update
    @comment = Gossip.find(params[:id])
    if @comment.update(content: params[:content], user_id: User.find_by(first_name: 'arnaudnimous').id)
      redirect_to ragot_path(params[:gossip_id]), notice: 'Mise a jour effectuée'
    else
      flash.now[:alert] = "désolé, il y a une erreur dans le formulaire"
      render :edit
    end
  end

  def destroy
    if Comment.find(params[:id]).destroy
      redirect_to gossip_path(params[:gossip_id]), notice: 'Commentaire supprimé'
    else
      flash.now[:alert] = "ça n'a pas l'air de fonctionner"
      render :edit
    end
  end


end
