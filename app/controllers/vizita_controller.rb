class VizitaController < InheritedResources::Base
  belongs_to :pacient
  respond_to :html, :js
  def create
    create!
    if params[:vizita] =="screening"
      flash[:notice] = "vizita de screening"
    else
      flash[:notice] = "vizita de felu #{params[:vizita]}"
    end
  end
  
end
