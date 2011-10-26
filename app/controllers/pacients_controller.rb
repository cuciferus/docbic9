class PacientsController < InheritedResources::Base
  respond_to :html, :js
  def randomizare
    #incomplet trebuie verificat
    @pacient = Pacient.find(params[:id])
    @anamneza = @pacient.anamnezas.build
    @clinic = @pacient.clinics.build
  end
  def includere #asta nu imi mai e util trebuie merged into REST
    @pacient = Pacient.find(params[:id])
  end
  def screening
    @pacient = Pacient.find(params[:id])
  end

end
