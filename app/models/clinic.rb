class Clinic < ActiveRecord::Base
  belongs_to :vizitum
  validates_presence_of :inaltime, :if => :screening?
  validates_presence_of :greutate, :if => :screening?
  def screening?
    self.vizitum.tip == "screening"
  end
end
