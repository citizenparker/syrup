class WelcomeController < ApplicationController
  def index
    redirect_to programs_path
  end
end
