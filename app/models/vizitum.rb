class Vizitum < ActiveRecord::Base
  #before_validation PrelucreazaNutritia.new
  belongs_to :pacient
  has_many :paraclinices
  has_many :mis#, :after_add => :get_attributes_from_paraclinices
  has_many :anamnezas
  has_many :clinics
  has_many :sgas
  accepts_nested_attributes_for :paraclinices
  accepts_nested_attributes_for :mis
  accepts_nested_attributes_for :sgas
  accepts_nested_attributes_for :clinics
  accepts_nested_attributes_for :anamnezas
  #before_save PrelucreazaNutritia.new
  before_save :prelucreaza_nutritia
  private
  def prelucreaza_nutritia
    self.paraclinices_attributes=[:data => self.data]
    #self.mis_attributes=[:data => self.data]
    self.clinics_attributes=[:data => self.data]
    self.anamnezas_attributes=[:data => self.data]
  end
end

class PrelucreazaNutritia
  def before_save(record)
    record.tip = "screening"
  end
  #alias_method :before_save
end

