#encoding: utf-8
class Pacient < ActiveRecord::Base
  self.per_page = 5
  CENTRE = ["Paulescu", "Davila"]
  has_many :vizita
  accepts_nested_attributes_for :vizita
  validates :semnat_icf, :acceptance => true #, :message => "E musai ca pacientul să semneze inform consentul"
  validates :cnp, :length => { :is =>13, :wrong_length => "CNP are 13 cifre" }, :numericality => { :only_integer =>true}
  validates_format_of :telefon1, :with => /\d{10}/, :message => "Un număr de telefon în România are 10 cifre"
  validates_format_of :telefon2, :with => /\d{10}/, :message => "Un număr de telefon în România are 10 cifre"
  def self.search(search, page) #tot nu merge
    if search
      paginate :per_page => 5, :page => page,
        :conditions => ['nume like ?', "%#{search}%"], :order => 'nume'
      #find(:all, :conditions => ['nume LIKE ?', "%#{search}"])
    else
      find(:all)
    end
  end
end
