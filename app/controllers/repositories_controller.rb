class RepositoriesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find_by(name: params[:username]) ||
      Profile.create_from_username(params[:username])
    @repositories = @profile.repositories
  end

end
