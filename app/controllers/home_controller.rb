class HomeController < ApplicationController
  before_action :authenticate_user!, only: [ :dashboard ]
  before_action :is_admin?, only: [ :dashboard ]

  def index

  end

  def artist

  end

  def instatoons

  end

  def artist_profile

  end

  def instatoon

  end

  def dashboard
    @artists = Artist.all
  end

  private

    def is_admin?
      unless current_user.admin?
        flash[:alert] = 'No tienes permisos para acceder a esta ruta'
        redirect_to root_path
      end
    end

end
