class Pacient < ActiveRecord::Base
  CENTRE = ["Paulescu", "Davila"]
  has_many :anamnezas
  has_many :clinics
  has_many :paraclinices
  has_many :sgas
  accepts_nested_attributes_for :anamnezas
  accepts_nested_attributes_for :sgas
  accepts_nested_attributes_for :paraclinices
  accepts_nested_attributes_for :clinics
  #accepts_nested_attributes_for :medicamentes
end
