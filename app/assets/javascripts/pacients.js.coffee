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
   "pacient[cnp]": {required: true}
   }
   })
