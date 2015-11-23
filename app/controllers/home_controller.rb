class HomeController < ApplicationController
  def index
    @members = Member.
      ethnicity_filter(params[:ethnicity]).
      paginate(page: params[:page], per_page: 5)
  end
end
