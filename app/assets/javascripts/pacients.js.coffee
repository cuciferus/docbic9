//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.validate.min
$(document).ready ->
   $("#pacient_data_dg_ckd").datepicker({dateFormat: 'yyyy-mm-dd'})
   $("#pacient_data_dg_diabet").datepicker()

   $("#new_pacient").validate({
   debug: true,
   rules:{
   "pacient[cnp]": {required: true, number: true, minlength: 13, maxlength: 13, remote:"/pacients/verifica_cnp"},
   "pacient[nume]": { required: true},
   "pacient[prenume]": { required: true},
   "pacient[telefon1]": { required: true, number: true, minlength: 10, maxlength: 10},
   "pacient[telefon2]": { required: true, number: true, minlength: 10, maxlength: 10}
   }
   messages: {
   "pacient[cnp]":{
    required: "Te rog introdu CNPul pacientului",
    number: "CNP e format din cifre",
    maxlength: "CNP are 13 cifre",
    remote: "A fost deja introdus un pacient cu acest CNP",
    minlength: "CNP are 13 cifre"},
    "pacient[nume]": {
    required: "Ai uitat numele pacientului",
    digits: "Să mori tu că are numele cu cifre!"},
    "pacient[prenume]": {
    required: "Ai uitat prenumele pacientului",
    digits: "Să mori tu că are prenumele cu cifre"},
    "pacient[telefon1]": {
    required: "Te rog un număr de telefon",
    minlength: "Un număr de telefon în România are 10 cifre",
    maxlength: "Un număr de telefon în România are 10 cifre"},
    "pacient[telefon2]": {
    required: "Te rog un număr de telefon",
    minlength: "Un număr de telefon în România are 10 cifre",
    maxlength: "Un număr de telefon în România are 10 cifre"},
   }
   })
