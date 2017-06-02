class CollaboratorsController < ApplicationController
  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.all
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

  def destroy
    # @user = User.find(params[:post_id])
    # comment = @post.comments.find(params[:id])
    #
    # if comment.destroy
    #   flash[:notice] = "Comment was deleted."
    #   redirect_to [@post.topic, @post]
    # else
    #   flash[:alert] = "Comment couldn't be deleted. Try again."
    #   redirect_to [@post.topic, @post]
    # end
  end
end
