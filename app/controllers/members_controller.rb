class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    filename = "/tmp/membber-card-#{@member.id_api}.pdf"
    Prawn::Document.generate(filename) do
      text "Hello World!"
    end
    send_file filename
  end
end
