class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Define the Toon object
  class Toon
    def initialize(title, author, img_url)
      @title = title
      @author = author
      @img_url = img_url
    end
    attr_reader :title
    attr_reader :author
    attr_reader :img_url
  end

  def scrape_toons
    #require 'open-uri'
    #tiempo = Nokogiri::HTML(open("http://www.eltiempo.com/"))
    #render text: tiempo

    # Pull in the page
    require 'open-uri'
    tiempo = Nokogiri::HTML(open("http://www.eltiempo.com/opinion/caricaturas"))

    # Narrow down on what we want and build the toons array
    toons = tiempo.css('.col-main-article')
    @toonsArray = []
    toons.each do |toon|
      title = toon.css('h3>a').text
      #author = toon.css('a')[0]['href']
      author = toon.css('.author-name').text
      img_url = toon.css('a>img').attr('src')
      @toonsArray << Toon.new(title, author, img_url)

      # download image code
      path = File.join Rails.root, 'app', 'assets', 'images', "#{title}.jpeg"
      @img_url_2 = "http://www.eltiempo.com/#{img_url}"
      File.open(path, 'wb') do |new_file|
        open(@img_url_2, 'r') do |img|
          new_file.write(img.read)
        end
      end
    end

    @images = Dir.glob("app/assets/images/*.jpeg")

    # We'll just try to render the array and see what happens
    render template: 'scrape_toons'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
