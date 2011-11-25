class Paraclinice < ActiveRecord::Base
  belongs_to :vizita
  validates_presence_of :hba1c, :if => :screening?
  validates_presence_of :hco3, :if => :screening?
  def screening?
    self.vizitum.tip == "screening"
  end
end
