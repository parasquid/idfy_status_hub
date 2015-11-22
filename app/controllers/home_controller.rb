class HomeController < ApplicationController
  def index
    cookies[:favourites] ||= JSON.generate([])
    favourites = JSON.parse(cookies[:favourites]) if params[:favourites]
    @members = Member.
      ethnicity_filter(params[:ethnicity]).
      favourites_filter(favourites).
      paginate(page: params[:page], per_page: 5)
  end

  def favourite
    favourites = JSON.parse(cookies[:favourites])
    favourites.push params[:id_api]
    cookies[:favourites] = JSON.generate(favourites.uniq)
    @member = Member.where(id_api: params[:id_api]).first
  end
end
