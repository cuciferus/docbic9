//= require jquery
//= require jquery.tooltip
egfr = (cnp, creatinina) ->
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
  varsta = (Number) (new Date).getFullYear() - anu
  raport = (Number) creatinina/k
  primu = Math.pow(Math.min(raport, 1), -0.411)
  doilea = Math.pow(Math.max(raport, 1), -1.209)
  treilea = Math.pow(0.993, 89)
  console.log(141*primu*doilea*treilea*coeficient)
  141*primu*doilea*treilea*coeficient
$(document).ready ->
	$("#comorbiditate_hint").et('<p> Comorbidităţile Severe:</b><br><ul><li> ICC cls III-IV NYHA</li><li> boala SIDA</li><li> boală coronariană severă</li><li> BPOC moderat sever</li><li> sechele neurologice severe</li><li>neoplasm metastazat sau chimioterapie recentă</li></ul></p>','click', {align:"start", color:"blue"})
	$("#sga_greutate_span:hint").click ->
	  alert("salut din link")
	  et('<p> salut din link</p>')
	
	$("#vizitum_paraclinice_attributes_creatinina").keyup ->
	  cnp= $("#cnp").html()
	  creatinina = (Number) $(this).val()
	  $("#egfr").replaceWith("<div id='egfr' span>"+ egfr(cnp, creatinina).toFixed(2)+ "ml/min/1.72m2</span></div>")
	  console.log("<div id='egfr' span>"+ egfr(cnp, creatinina).toFixed(2)+ "ml/min/1.72m2</span></div>")
	  return true
	  ###
	$('#submit').click ->
	  alert 'salut'
	  return false
	  ###
	$("#commit").et('<p> Eşti sigur ca pacientul indeplineşte toate criteriile de includere şi <br> nici un criteriu de excludere?</p>', 'click')
