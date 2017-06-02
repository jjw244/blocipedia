class CollaboratorsController < ApplicationController
  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.all
    @user_emails = User.where.not(id: current_user.id || @wiki.users.pluck(:id)).map(&:email)
  end

  def update
    @wiki = Wiki.find(params[:wiki_id])
    authorize @wiki

    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki page. Please try again."
      render :edit
    end
  end

  def create
    user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    if Collaborator.create(user_id: user.id, wiki_id: @wiki.id)
      flash[:notice] = 'Collaborator added'
    else
      flash[:alert] = 'Collaborator not added'
    end
    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = Collaborator.find_by(user_id: @user.id, wiki_id: @wiki.id)
    if collaborator.destroy
      flash[:notice] = 'Collaborator removed'
    else
      flash[:alert] = 'Collaborator not removed'
    end
    redirect_to edit_wiki_path(@wiki)

  end
end
