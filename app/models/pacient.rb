#encoding: utf-8
class Pacient < ActiveRecord::Base
  self.per_page = 5
  CENTRE = ["Paulescu", "Davila"]
  has_many :vizita
  accepts_nested_attributes_for :vizita
  #validates :semnat_icf, :acceptance => true #, :message => "E musai ca pacientul să semneze inform consentul"
  validates :cnp, :length => { :is =>13, :wrong_length => "CNP are 13 cifre" }, :numericality => { :only_integer =>true}
  validates :telefon1, :length => { :is =>10, :wrong_length => "Un număr de telefon în România are 10 cifre"}, :numericality => { :only_integer =>true}
  validates :telefon2, :length => { :is =>10, :wrong_length => "Un număr de telefon în România are 10 cifre"}, :numericality => { :only_integer =>true}
end
