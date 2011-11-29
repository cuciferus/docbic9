require 'will_paginate/array'
class PacientsController < InheritedResources::Base
  respond_to :html, :js, :json
  respond_to :pdf, :only => :consent
  def verifica_cnp
    @pacient = Pacient.find_by_cnp(params[:pacient][:cnp])
    respond_to do |format|
      format.json { render :json => !@pacient}
    end
  end

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



end
