class DowngradesController < ApplicationController
  def new
  end

  def create
    if current_user.transaction do
      current_user.standard!
      current_user.wikis.update_all(private: false)
    end
    flash[:notice] = "You have successfully downgraded your account " +
      "and your private wikis are now public"
    else
    flash[:notice] = "There was an error downgrading your account, " +
      "please try again"
    end

    redirect_to root_path
  end
end
