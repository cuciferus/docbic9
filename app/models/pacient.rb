class Pacient < ActiveRecord::Base
  self.per_page = 5
  CENTRE = ["Paulescu", "Davila"]
  has_many :vizita
  accepts_nested_attributes_for :vizita
end
