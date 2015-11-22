class HomeController < ApplicationController
  def index
    cookies[:favourites] ||= JSON.generate([])
    if params[:favourites]
      favourites = JSON.parse(cookies[:favourites])
    else
      favourites = []
    end
    @members = Member.
      ethnicity_filter(params[:ethnicity]).
      favourites_filter(favourites).
      paginate(page: params[:page], per_page: 5)
  end

  def favourite
    favourites = JSON.parse(cookies[:favourites])
    id_api = params[:id_api]
    if favourites.include? id_api
      favourites.delete id_api
    else
      favourites.push params[:id_api]
    end
    cookies[:favourites] = JSON.generate(favourites.uniq)
    @member = Member.where(id_api: params[:id_api]).first
  end
end
