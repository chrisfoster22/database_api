class ProfilesController < ApplicationController
  def index
  end

  def show
    @profile = Profile.find_by_username(params[:username]) ||
      Profile.create_from_username(params[:username])
  end
end
