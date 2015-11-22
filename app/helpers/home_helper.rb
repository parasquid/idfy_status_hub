module HomeHelper
  def nav_active(ethnicity)
    if ethnicity.nil? && params[:ethnicity].nil?
      return "active"
    end
    params[:ethnicity] == ethnicity.to_s ? "active" : ""
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
    favourites.include?(id) ? "btn-success" : "btn-default"
  end
end
