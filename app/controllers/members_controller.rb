require 'open-uri'
class MembersController < ApplicationController
  include ActionView::Helpers::DateHelper
  def show
    @member = Member.find(params[:id])
    filename = "/tmp/member-card-#{@member.id_api}.pdf"
    Prawn::Document.generate(filename) do |pdf|
      pdf.image open(@member.image)
      pdf.move_down 10
      pdf.text "Ethnicity: #{@member.ethnicity_string}"
      pdf.text "Status: #{@member.status}"
      pdf.text "Date of Birth: #{@member.dob} (#{time_ago_in_words(@member.dob)} old)"
      pdf.text "Weight: #{@member.weight_in_kg} kg"
      pdf.text "Height: #{@member.height} cm"
      pdf.text "Vegan: #{@member.is_veg.humanize}"
      pdf.text "Drink: #{@member.drink.humanize}"
     end
    send_file filename
  end
end
