class DowngradeController < ApplicationController
  def new
  end

  def create
    current_user.standard!
    current_user.wikis.each do |publik|
      publik.update_attribute(:private, false)
    end

    flash[:notice] = "You have successfully downgraded your account and your private wikis are now public"

    redirect_to root_path
  end
end
