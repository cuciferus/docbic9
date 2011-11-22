class Vizitum < ActiveRecord::Base
  belongs_to :pacient
  has_one :paraclinice
  has_one :medicamente
  has_one :mi
  has_one :anamneza
  has_one :clinic
  has_one :sga
  accepts_nested_attributes_for :paraclinice
  accepts_nested_attributes_for :medicamente
  accepts_nested_attributes_for :mi
  accepts_nested_attributes_for :sga
  accepts_nested_attributes_for :clinic
  accepts_nested_attributes_for :anamneza
  #before_save PrelucreazaNutritia.new
  before_update :prelucreaza_nutritia
  private
  def calculeaza_bmi_categorie(inaltime, greutate)
    puts 'G=', greutate, 'I=', inaltime
    bmi = greutate/(inaltime **2)
    case bmi
    when bmi > 20
      bmi_categorie = 0
    when 18 .. 20
      bmi_categorie = 1
    when 16 .. 18
      bmi_categorie =2
    when bmi <16
      bmi_categorie =3
    end
    puts bmi_categorie
    bmi_categorie
  end
  def prelucreaza_nutritia
    puts 'salut din callback'
    if self.tip == "screening"
      self.paraclinice_attributes={:data => self.data}
      self.clinic_attributes={:data => self.data}
      self.anamneza_attributes={:data => self.data}
      puts 'data vizitei e', self.data
      puts 'data anamnezei e', self.anamneza.data

    end
  end
end

class PrelucreazaNutritia
  def before_save(record)
    record.tip = "screening"
  end
  #alias_method :before_save
end

