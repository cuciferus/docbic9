class VizitaController < InheritedResources::Base
  belongs_to :pacient, :finder => :find_by_id, :param => :pacient_id
  respond_to :html, :js
  def create
    create!
    if params[:vizita] =="screening"
      flash[:notice] = "vizita de screening"
    else
      flash[:notice] = "altfel de vizita de felu #{params[:vizita]}"
    end
  end
end
