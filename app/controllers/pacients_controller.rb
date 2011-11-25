require 'will_paginate/array'
class PacientsController < InheritedResources::Base
  respond_to :html, :js
  respond_to :pdf, :only => :consent

  def consent
    respond_to do |format|
      format.pdf do
        send_data Inform.new.to_pdf, :filename => "InformConsent.pdf", :type => "application/pdf",
                                      :page_size => "A4"
      end
    end
  end

  def index
    @pacients = Pacient.paginate(:page => params[:page])
  end

  def create
     @pacient = Pacient.new(params[:pacient])
     respond_to do |format|
       if @pacient.save
         format.html {redirect_to new_pacient_vizitum_path(@pacient, :tip => "screening" )}
       else
         format.html { render :action => "new"}
       end
     end
  end

  def randomizare
   #incomplet trebuie verificat
   @pacient = Pacient.find(params[:id])
   @anamneza = @pacient.anamnezas.build
   @clinic = @pacient.clinics.build
  end

  def includere #asta nu imi mai e util trebuie merged into REST
    @pacient = Pacient.find(params[:id])
  end

end
