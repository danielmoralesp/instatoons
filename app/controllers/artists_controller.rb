class ArtistsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]
  before_action :is_admin?, only: [ :new, :create, :edit, :update, :destroy ]

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = 'El artista ha sido creado con éxito'
      redirect_to dashboard_path
    else
      flash[:alert] = 'Algo fallo, el artista no ha sido creado con éxito'
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      flash[:notice] = 'El artista ha sido actualizado con éxito'
      redirect_to dashboard_path
    else
      flash[:alert] = 'Algo fallo, el artista no ha sido actualizado con éxito'
      render :new
    end
  end

  def destroy
    @artist = Artist.find(params[:id])

    @artist.destroy
    flash[:notice] = 'El artista ha sido eliminado'
    redirect_to dashboard_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :image)
    end

    def is_admin?
      unless current_user.admin?
        flash[:alert] = 'No tienes permisos para acceder a esta ruta'
        redirect_to root_path
      end
    end
end
