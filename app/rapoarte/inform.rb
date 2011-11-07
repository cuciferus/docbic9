#encoding: utf-8
class Inform < Prawn::Document
  #va genera inform consentul
  def to_pdf
    move_down 20
    font_size 14
    font("#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf") do
      text "Formular pentru Consimţământul informat al pacienţilor"
      move_down 60
      font_size 12
      text "Dumneavoastră aţi fost invitaţi să participaţi la un studiu complex care are o componentă clinică şi una paraclinică. Acest formular conţine informaţii referitoare la riscurile şi beneficii potenţiale şi la procedura de consimţământ, pentru a decide liber de orice constrângere dacă acceptaţi sau nu să participaţi la acest studiu.", :align => :justify
      text "Care este scopul studiului. În acest studiu ne propunem să demonstrăm impactul benefic al corectării acidozei renale cronice asupra evoluţiei Bolii cronice de rinichi şi asupra stării de nutriţie a pacientului pe baza datelor clinice şi paraclinice obţinute de la subiecţii incluşi în studiu.", :inline_format => true
      text "De ce avem nevoie pentru desfăşurarea studiului. În acest studiu se vor realiza investigaţii clinice şi paraclinice. Analizele paraclinice se realizează pe probe biologice (de sânge şi urină ) care vor fi recoltate de la dumneavoastră. Probele se vor recolta într-o unitate medicală (IDNMB „N. Paulescu” si Spitalul „Carol Davila”), în condiţii conficențialitate și de maximă siguranţă."
      text "Unde vor ajunge probele şi datele dvs clinice şi paraclinice. Probele de sânge vor fi trimise la laboratorul medical ataşat unităţii sanitare, unde se vor face analizele de biochimie urinara si sanguina.  Unităţile medicale partenere vor asigura investigarea dvs din punct de vedere clinic. După efectuarea determinărilor paraclinice probele nu vor fi păstrate. Rezultatele analizelor dumneavoastră vă vor fi comunicate după fiecare recoltare."
      text "Care sunt riscurile dvs dacă intraţi în acest studiu. În timpul acestui studiu se înregistrează date clinice, se recoltează probe biologice (menţionate anterior), şi veţi fi alocat(după o regula dinainte stabilită) unuia din cele două grupuri: cu tratament standard sau cu tratament intensiv. În grupul standard tratamentul nu se schimbă / ajustează tratamentul pe care îl urmaţi. În grupul cu tratament intensiv tratamentul se va schimba astfel încât să se obţină un bicarbonat seric la un nivel 24-26mmol/L, şi veţi beneficia de o consiliere nutriţională intensivă. În nici un grup nu se vor administra tratamente experimentale.  Tratamentul dumneavoastră indiferent de grupul în care participaţi va fi stabilit de un medic specialist. Din estimările noastre riscurile la care vă expuneţi sunt minime, din punct de vedere medical: alcaloză metabolică şi retenţia hidrosalină, in cazul grupului tratat intensiv."
      text "Care sunt beneficiile dvs dacă doriţi să participaţi şi sunteţi selectaţi pentru includerea în studiu. Voluntarii vor fi selectaţi pentru a fi incluşi în loturile prestabilite nu vor avea beneficii materiale sau financiare din partea organizatorilor studiului. Datele personale au caracter confidenţial şi nu vor fi făcute publice."
      text "Ce se întâmplă dacă refuzaţi să intraţi sau dacă doriţi să ieşiţi din studiu. Refuzul de a intra în studiu nu va afecta îngrijirea dumneavoastră medicală prezentă sau ulterioară. Dacă ulterior doriţi ca proba biologică să nu mai fie analizată, trebuie să ne comunicaţi acest lucru în scris (fără a fi necesară şi o justificare a hotărârii dumneavoastră), prin intermediul medicului care a făcut includerea în studiu."
      text "Ce se întâmplă cu rezultatele studiului. La terminarea studiului, datele clinice şi paraclinice obţinute pe parcursul desfăşurării studiului vor fi folosite pentru a determina eventualele beneficii/riscuri ale unei corectării intensive a acidozei metabolice renale. Rezultatele ştiinţifice obţinute în urma acestui studiu vor fi publicate în cărţi, reviste şi/sau la manifestări ştiinţifice de specialitate, fără ca identitatea dvs să fie dezvăluită. Rezultatele studiului pot aduce, in viitor, îmbunătăţiri în îngrijirea pacienţilor cu boală de rinichi şi acidoză metabolică."
      text "Ce trebuie să faceţi dacă sunteţi de acord cu intrarea în studiu şi cu prevederile prezentului Formular pentru Consimţământul informat al pacienţilor. Dacă sunteţi de acord să participaţi la acest studiu trebuie să urmaţi instrucţiunile medicului dumneavoastră şi să semnaţi acest formular. Prin semnarea formularului confirmaţi următoarele:"
      text "1. Am citit şi am înţeles informaţiile cuprinse în acest formular."
      text "2. Am avut posibilitatea să cer informaţii suplimentare despre studiu şi am primit răspunsuri satisfăcătoare."
      text "3. Am avut timp suficient pentru evaluarea datele furnizate."
      text "4. Înţeleg că pot refuza să iau parte la acest studiu sau că mă pot retrage în orice moment fără ca acest lucru să atragă o penalizare."
      text "5. Înţeleg că medicul care mă include în studiu va transmite informaţii medicale organizatorilor acestui studiu"
      text "6. Am înţeles că intrarea mea în studiu este lipsită de orice recompensă materială sau financiară."
      move_down 20
      text "Numele în clar", :align => :left
      move_down 5
      text "Semnătura", :align => :left
      text "Data" ,:align => :right
    end
    render
  end
end
