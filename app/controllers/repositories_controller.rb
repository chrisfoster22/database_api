class RepositoriesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find_by(name: params[:username]) ||
      Profile.create_from_username(params[:username])
    @repositories = Repository.where(profile_id: @profile.id)
    if @repositories.length == 0
      @repositories = Repository.create_from_username(params[:username]).order(:git_updated).reverse
    end
  end

end
