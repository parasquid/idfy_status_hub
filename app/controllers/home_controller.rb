class HomeController < ApplicationController
  def index
    @members = Member.
      ethnicity_filter(params[:ethnicity]).
      paginate(page: params[:page])
  end
end
