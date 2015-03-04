class RepositoriesController < ApplicationController

  def index
  end

  def show
    time = Time.now
    @profile = Profile.find_by(name: params[:username]) ||
      @profile = Profile.create_from_username(params[:username])
    if (time - @profile.updated_at) / 1.day > 1
      Profile.update_from_username
    end
    @repositories = Repository.where(profile_id: @profile.id) ||
      @repositories = Repository.create_from_username(params[:username]).order(:git_updated).reverse
    if (time - Repository.find_by(profile_id: @profile.id).updated_at) / 1.hour > 2
      Repository.update_from_username
    end
  end

end
