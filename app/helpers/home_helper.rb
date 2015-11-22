module HomeHelper
  def nav_active(option)
    if option.nil? && params[:ethnicity].nil? && params[:favourites].nil?
      return "active"
    elsif params[:ethnicity]
      params[:ethnicity] == option.to_s ? "active" : ""
    elsif params[:favourites] && option == "favourites"
      params[:favourites] == "true" ? "active" : ""
    end
  end

  def ethnicity_string
    ethnicity = params[:ethnicity]
    if ethnicity.nil?
      "All"
    else
      ETHNICITY_LUT[ethnicity.to_i].to_s.titleize
    end
  end

  def is_favourite_class(id)
    favourites = JSON.parse(cookies[:favourites])
    favourites.include?(id.to_s) ? "btn-danger" : "btn-default"
  end
end
