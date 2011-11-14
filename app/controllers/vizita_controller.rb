class VizitaController < InheritedResources::Base
  belongs_to :pacient
  respond_to :html, :js
  def new
    @pacient = Pacient.find(params[:pacient_id])
    @vizitum = @pacient.vizita.create(:tip => params[:tip])
  end
  
  def create
    if params[:tip] =="screening"
      flash[:notice] = "vizita de screening"
    else
      flash[:notice] = "vizita de felu #{params[:tip]}", params[:tip]
    end
    create!
  end
  
end
