class Vizitum < ActiveRecord::Base
  #nu imi trebuie validari pt screening 
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
  before_update :prelucreaza_nutritia
  #validates_presence_of :data, :if => :screening?
  def screening?
    self.tip == "screening"
  end
  def criterii_includere
    if self.tip == "screening"
      if self.paraclinice.hba1c > 8
        errors.add_to_base("Pacient dezechilibrat")
      end
    end
  end
  private
  def verifica_criterii
    if self.tip == "screening" #conditiile nu sunt bune
      puts 'glicozilata e'
      puts self.paraclinice.hba1c
      #if self.paraclinice.hba1c > 8 or calculeaza_epi > 30 or self.paraclinice.hco3 < 20
        #self.pacient.inclus=false
      #end
    end
  end
  def calculeaza_epi
    cnp = self.pacient.cnp
    an_nastere = '19'+ cnp[1,2]
    varsta = Date.today.year.to_int - an_nastere
    if cnp[0] == 1
      k = 0.9
      alfa = -0.4111
      coeficient = 1
    elsif cnp[0] == 2
      k = 0.7
      alfa = -0.329
      coeficient = 1.018
    end
    raport = self.paraclinice.creatinina/k
    primu = [raport, 1].min**-0.411
    doilea = [raport, 1].max ** -1.209
    treilea = 0.993**89
    puts 'epi zice'
    puts 141*primu*doilea*treilea*coeficient
    141*primu*doilea*treilea*coeficient
  end
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
      puts 'data vizitei e', self.data
      puts 'data anamnezei e', self.anamneza.data
      puts 'glicozilata e', self.paraclinice.hba1c #merge si pot calcula lucruri
    end
  end
end

class PrelucreazaNutritia
  def before_save(record)
    record.tip = "screening"
  end
  #alias_method :before_save
end

