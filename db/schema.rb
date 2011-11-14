# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111114192556) do

  create_table "anamnezas", :force => true do |t|
    t.float    "fumator"
    t.integer  "etanol"
    t.boolean  "ima"
    t.boolean  "angina"
    t.boolean  "icc"
    t.boolean  "avc"
    t.boolean  "aomi"
    t.boolean  "amputatii"
    t.boolean  "bpoc"
    t.string   "hepatopatii"
    t.string   "neoplasm"
    t.boolean  "retinopatie"
    t.integer  "spitalizare"
    t.string   "cod_spitalizare"
    t.integer  "vizitum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data"
    t.string   "tip_vizita"
  end

  add_index "anamnezas", ["vizitum_id"], :name => "index_anamnezas_on_pacient_id"

  create_table "clinics", :force => true do |t|
    t.float    "inaltime"
    t.float    "greutate"
    t.float    "tas"
    t.float    "tad"
    t.float    "circumferinta_abdomen"
    t.float    "circumferinta_brat"
    t.float    "pliu_cutantat_brat"
    t.float    "forta_de_strangere_mana"
    t.date     "data"
    t.integer  "vizitum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinics", ["vizitum_id"], :name => "index_clinics_on_pacient_id"

  create_table "medicamentes", :force => true do |t|
    t.integer  "insulina"
    t.string   "tip_fier"
    t.integer  "doza_fier"
    t.string   "tip_ase"
    t.integer  "doza_ase"
    t.boolean  "beta_blocante"
    t.boolean  "ras"
    t.boolean  "diuretice"
    t.boolean  "vasodilatatoare"
    t.date     "data"
    t.integer  "vizitum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "bicarbonat"
  end

  add_index "medicamentes", ["vizitum_id"], :name => "index_medicamentes_on_pacient_id"

  create_table "mis", :force => true do |t|
    t.integer  "greutate"
    t.integer  "aport"
    t.integer  "simptome_gi"
    t.integer  "capacitate_functionala"
    t.integer  "co_morbiditate"
    t.integer  "grasime"
    t.integer  "muschi"
    t.integer  "bmi"
    t.integer  "albumina"
    t.integer  "tibc"
    t.integer  "vizitum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mis", ["vizitum_id"], :name => "index_mis_on_vizita_id"

  create_table "pacient_iesits", :force => true do |t|
    t.date     "data"
    t.string   "motiv"
    t.integer  "pacient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pacient_iesits", ["pacient_id"], :name => "index_pacient_iesits_on_pacient_id"

  create_table "pacients", :force => true do |t|
    t.string   "nume"
    t.string   "prenume"
    t.string   "cnp",            :limit => 13
    t.string   "telefon1",       :limit => 10
    t.string   "telefon2",       :limit => 10
    t.text     "adresa"
    t.date     "data_dg_ckd"
    t.date     "data_dg_diabet"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tip_protocol"
    t.string   "centru"
    t.boolean  "inclus"
  end

  create_table "paraclinices", :force => true do |t|
    t.float    "hemoglobina"
    t.float    "hematocrit"
    t.float    "pcr"
    t.float    "glicemie"
    t.float    "hba1c"
    t.float    "colesterol_total"
    t.float    "hdl_colesterol"
    t.float    "trigliceride"
    t.float    "albumina"
    t.float    "tsat"
    t.float    "feritina"
    t.float    "calcemie"
    t.float    "fosfatemie"
    t.float    "fosfataza_alcalina"
    t.float    "pth"
    t.float    "ph"
    t.float    "pco2"
    t.float    "hco3"
    t.float    "sodiu"
    t.float    "potasiu"
    t.float    "clor"
    t.float    "creatinina"
    t.float    "uree"
    t.float    "uree_urinara"
    t.float    "albumina_urinara_spot"
    t.float    "creatinina_urinara"
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tip_vizita"
    t.integer  "vizitum_id"
  end

  add_index "paraclinices", ["vizitum_id"], :name => "index_paraclinices_on_vizita_id"

  create_table "sf36s", :force => true do |t|
    t.integer  "pacient_id"
    t.date     "data"
    t.integer  "sanatatea"
    t.integer  "sanatatea_comparativ"
    t.integer  "activitati_obositoare"
    t.integer  "activitati_moderate"
    t.integer  "ridicat"
    t.integer  "urcat_etaje"
    t.integer  "urcat_etaj"
    t.integer  "aplecat"
    t.integer  "km1"
    t.integer  "sute_metri"
    t.integer  "o_suta_metri"
    t.integer  "imbaiere"
    t.boolean  "perioada_timp"
    t.boolean  "mai_putine"
    t.boolean  "limitat"
    t.boolean  "dificultati"
    t.boolean  "perioada_emotionale"
    t.boolean  "mai_putine_emotionale"
    t.boolean  "grija"
    t.integer  "familie"
    t.integer  "dureri"
    t.integer  "durerea"
    t.integer  "plin_viata"
    t.integer  "nervos"
    t.integer  "deprimat"
    t.integer  "calm"
    t.integer  "energie"
    t.integer  "descurajat"
    t.integer  "extenuat"
    t.integer  "fericit"
    t.integer  "obosit"
    t.integer  "vizite"
    t.integer  "imbolnavesc"
    t.integer  "la_fel"
    t.integer  "inrautateasca"
    t.integer  "sanatate_excelenta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sf36s", ["pacient_id"], :name => "index_sf36s_on_pacient_id"

  create_table "sgas", :force => true do |t|
    t.integer  "vizitum_id"
    t.date     "data"
    t.integer  "modificari_greutate"
    t.integer  "modificari_aport_alimentar"
    t.integer  "simptome_gi"
    t.integer  "capacitate_functionala"
    t.integer  "comorbiditatea"
    t.integer  "grasime"
    t.integer  "amiotrofie"
    t.integer  "imc"
    t.integer  "pcr"
    t.integer  "feritina"
    t.integer  "albumina"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tip_vizita"
  end

  create_table "vizita", :force => true do |t|
    t.date     "data"
    t.string   "tip"
    t.integer  "pacient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vizita", ["pacient_id"], :name => "index_vizita_on_pacient_id"

end
