//= require jquery
//= require jquery.tooltip
$(document).ready ->
	$("#comorbiditate_hint").et('<p> Comorbidităţile sunt cotate astfel:<br>Moderate:<br> <ul> <li> ICC cls I-II NYHA</li><li> boală coronariană documentată</li><li>boli pulmonare cronice compensate funcţional</li><li> HTA formă moderat/severă</li><ul></p>','click', {align:"start", color:"blue"})
	$("#sga_greutate_span:hint").click ->
	  alert("salut din link")
	  et('<p> salut din link</p>')
	$("#commit").et('<p> Eşti sigur ca pacientul indeplineşte toate criteriile de includere şi <br> nici un criteriu de excludere?</p>', 'click')
	$("#egfr").click ->
	  cnp= $("#cnp").html()
	  sex = cnp[0]
	  if sex == '1' 
	    k = 0.9
	    alfa = -0.4111
	    coeficient = 1
	  if sex == '2' 
	    k = 0.7
	    alfa = -0.329
	    coeficient = 1.018
	  an_nastere = cnp[1]+cnp[2]
	  an=19+ an_nastere
	  anu = (Number) an
	  varsta = (new Date).getFullYear() - anu
	  creatinina = $("#pacient_paraclinices_attributes_0_creatinina").val()
	  raport = creatinina/k
	  egfr = 141*Math.pow(min(raport,1),alfa)*Math.pow(0.933, varsta)*coeficient
	  alert egfr
	$('.submit_me').click ->
	  alert 'salut'
	  return false
