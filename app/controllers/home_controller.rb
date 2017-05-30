class HomeController < ApplicationController

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

end
