/**
 * jQuery Validation Plugin 1.9.0
 *
 * http://bassistance.de/jquery-plugins/jquery-plugin-validation/
 * http://docs.jquery.com/Plugins/Validation
 *
 * Copyright (c) 2006 - 2011 Jörn Zaefferer
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 */
(function(a){a.extend(a.fn,{validate:function(b){if(this.length){var d=a.data(this[0],"validator");return d?d:(this.attr("novalidate","novalidate"),d=new a.validator(b,this[0]),a.data(this[0],"validator",d),d.settings.onsubmit&&(b=this.find("input, button"),b.filter(".cancel").click(function(){d.cancelSubmit=!0}),d.settings.submitHandler&&b.filter(":submit").click(function(){d.submitButton=this}),this.submit(function(b){function e(){if(d.settings.submitHandler){if(d.submitButton)var b=a("<input type='hidden'/>").attr("name",d.submitButton.name).val(d.submitButton.value).appendTo(d.currentForm);return d.settings.submitHandler.call(d,d.currentForm),d.submitButton&&b.remove(),!1}return!0}return d.settings.debug&&b.preventDefault(),d.cancelSubmit?(d.cancelSubmit=!1,e()):d.form()?d.pendingRequest?(d.formSubmitted=!0,!1):e():(d.focusInvalid(),!1)})),d)}b&&b.debug&&window.console&&console.warn("nothing selected, can't validate, returning nothing")},valid:function(){if(a(this[0]).is("form"))return this.validate().form();var b=!0,d=a(this[0].form).validate();return this.each(function(){b&=d.element(this)}),b},removeAttrs:function(b){var d={},e=this;return a.each(b.split(/\s/),function(a,b){d[b]=e.attr(b),e.removeAttr(b)}),d},rules:function(b,d){var e=this[0];if(b){var f=a.data(e.form,"validator").settings,g=f.rules,h=a.validator.staticRules(e);switch(b){case"add":a.extend(h,a.validator.normalizeRule(d)),g[e.name]=h,d.messages&&(f.messages[e.name]=a.extend(f.messages[e.name],d.messages));break;case"remove":if(!d)return delete g[e.name],h;var i={};return a.each(d.split(/\s/),function(a,b){i[b]=h[b],delete h[b]}),i}}return e=a.validator.normalizeRules(a.extend({},a.validator.metadataRules(e),a.validator.classRules(e),a.validator.attributeRules(e),a.validator.staticRules(e)),e),e.required&&(f=e.required,delete e.required,e=a.extend({required:f},e)),e}}),a.extend(a.expr[":"],{blank:function(b){return!a.trim(""+b.value)},filled:function(b){return!!a.trim(""+b.value)},unchecked:function(a){return!a.checked}}),a.validator=function(b,d){this.settings=a.extend(!0,{},a.validator.defaults,b),this.currentForm=d,this.init()},a.validator.format=function(b,d){return arguments.length==1?function(){var d=a.makeArray(arguments);return d.unshift(b),a.validator.format.apply(this,d)}:(arguments.length>2&&d.constructor!=Array&&(d=a.makeArray(arguments).slice(1)),d.constructor!=Array&&(d=[d]),a.each(d,function(a,c){b=b.replace(RegExp("\\{"+a+"\\}","g"),c)}),b)},a.extend(a.validator,{defaults:{messages:{},groups:{},rules:{},errorClass:"error",validClass:"valid",errorElement:"label",focusInvalid:!0,errorContainer:a([]),errorLabelContainer:a([]),onsubmit:!0,ignore:":hidden",ignoreTitle:!1,onfocusin:function(a){this.lastActive=a,this.settings.focusCleanup&&!this.blockFocusCleanup&&(this.settings.unhighlight&&this.settings.unhighlight.call(this,a,this.settings.errorClass,this.settings.validClass),this.addWrapper(this.errorsFor(a)).hide())},onfocusout:function(a){!this.checkable(a)&&(a.name in this.submitted||!this.optional(a))&&this.element(a)},onkeyup:function(a){(a.name in this.submitted||a==this.lastElement)&&this.element(a)},onclick:function(a){a.name in this.submitted?this.element(a):a.parentNode.name in this.submitted&&this.element(a.parentNode)},highlight:function(b,d,e){b.type==="radio"?this.findByName(b.name).addClass(d).removeClass(e):a(b).addClass(d).removeClass(e)},unhighlight:function(b,d,e){b.type==="radio"?this.findByName(b.name).removeClass(d).addClass(e):a(b).removeClass(d).addClass(e)}},setDefaults:function(b){a.extend(a.validator.defaults,b)},messages:{required:"This field is required.",remote:"Please fix this field.",email:"Please enter a valid email address.",url:"Please enter a valid URL.",date:"Please enter a valid date.",dateISO:"Please enter a valid date (ISO).",number:"Please enter a valid number.",digits:"Please enter only digits.",creditcard:"Please enter a valid credit card number.",equalTo:"Please enter the same value again.",accept:"Please enter a value with a valid extension.",maxlength:a.validator.format("Please enter no more than {0} characters."),minlength:a.validator.format("Please enter at least {0} characters."),rangelength:a.validator.format("Please enter a value between {0} and {1} characters long."),range:a.validator.format("Please enter a value between {0} and {1}."),max:a.validator.format("Please enter a value less than or equal to {0}."),min:a.validator.format("Please enter a value greater than or equal to {0}.")},autoCreateRanges:!1,prototype:{init:function(){function b(b){var d=a.data(this[0].form,"validator"),e="on"+b.type.replace(/^validate/,"");d.settings[e]&&d.settings[e].call(d,this[0],b)}this.labelContainer=a(this.settings.errorLabelContainer),this.errorContext=this.labelContainer.length&&this.labelContainer||a(this.currentForm),this.containers=a(this.settings.errorContainer).add(this.settings.errorLabelContainer),this.submitted={},this.valueCache={},this.pendingRequest=0,this.pending={},this.invalid={},this.reset();var d=this.groups={};a.each(this.settings.groups,function(b,e){a.each(e.split(/\s/),function(a,c){d[c]=b})});var e=this.settings.rules;a.each(e,function(b,d){e[b]=a.validator.normalizeRule(d)}),a(this.currentForm).validateDelegate("[type='text'], [type='password'], [type='file'], select, textarea, [type='number'], [type='search'] ,[type='tel'], [type='url'], [type='email'], [type='datetime'], [type='date'], [type='month'], [type='week'], [type='time'], [type='datetime-local'], [type='range'], [type='color'] ","focusin focusout keyup",b).validateDelegate("[type='radio'], [type='checkbox'], select, option","click",b),this.settings.invalidHandler&&a(this.currentForm).bind("invalid-form.validate",this.settings.invalidHandler)},form:function(){return this.checkForm(),a.extend(this.submitted,this.errorMap),this.invalid=a.extend({},this.errorMap),this.valid()||a(this.currentForm).triggerHandler("invalid-form",[this]),this.showErrors(),this.valid()},checkForm:function(){this.prepareForm();for(var a=0,b=this.currentElements=this.elements();b[a];a++)this.check(b[a]);return this.valid()},element:function(b){this.lastElement=b=this.validationTargetFor(this.clean(b)),this.prepareElement(b),this.currentElements=a(b);var d=this.check(b);return d?delete this.invalid[b.name]:this.invalid[b.name]=!0,this.numberOfInvalids()||(this.toHide=this.toHide.add(this.containers)),this.showErrors(),d},showErrors:function(b){if(b){a.extend(this.errorMap,b),this.errorList=[];for(var d in b)this.errorList.push({message:b[d],element:this.findByName(d)[0]});this.successList=a.grep(this.successList,function(a){return!(a.name in b)})}this.settings.showErrors?this.settings.showErrors.call(this,this.errorMap,this.errorList):this.defaultShowErrors()},resetForm:function(){a.fn.resetForm&&a(this.currentForm).resetForm(),this.submitted={},this.lastElement=null,this.prepareForm(),this.hideErrors(),this.elements().removeClass(this.settings.errorClass)},numberOfInvalids:function(){return this.objectLength(this.invalid)},objectLength:function(a){var b=0,c;for(c in a)b++;return b},hideErrors:function(){this.addWrapper(this.toHide).hide()},valid:function(){return this.size()==0},size:function(){return this.errorList.length},focusInvalid:function(){if(this.settings.focusInvalid)try{a(this.findLastActive()||this.errorList.length&&this.errorList[0].element||[]).filter(":visible").focus().trigger("focusin")}catch(b){}},findLastActive:function(){var b=this.lastActive;return b&&a.grep(this.errorList,function(a){return a.element.name==b.name}).length==1&&b},elements:function(){var b=this,d={};return a(this.currentForm).find("input, select, textarea").not(":submit, :reset, :image, [disabled]").not(this.settings.ignore).filter(function(){return!this.name&&b.settings.debug&&window.console&&console.error("%o has no name assigned",this),this.name in d||!b.objectLength(a(this).rules())?!1:d[this.name]=!0})},clean:function(b){return a(b)[0]},errors:function(){return a(this.settings.errorElement+"."+this.settings.errorClass,this.errorContext)},reset:function(){this.successList=[],this.errorList=[],this.errorMap={},this.toShow=a([]),this.toHide=a([]),this.currentElements=a([])},prepareForm:function(){this.reset(),this.toHide=this.errors().add(this.containers)},prepareElement:function(a){this.reset(),this.toHide=this.errorsFor(a)},check:function(b){b=this.validationTargetFor(this.clean(b));var d=a(b).rules(),e=!1,f;for(f in d){var g={method:f,parameters:d[f]};try{var h=a.validator.methods[f].call(this,b.value.replace(/\r/g,""),b,g.parameters);if(h=="dependency-mismatch")e=!0;else{e=!1;if(h=="pending"){this.toHide=this.toHide.not(this.errorsFor(b));return}if(!h)return this.formatAndAdd(b,g),!1}}catch(i){throw this.settings.debug&&window.console&&console.log("exception occured when checking element "+b.id+", check the '"+g.method+"' method",i),i}}if(!e)return this.objectLength(d)&&this.successList.push(b),!0},customMetaMessage:function(b,d){if(a.metadata){var e=this.settings.meta?a(b).metadata()[this.settings.meta]:a(b).metadata();return e&&e.messages&&e.messages[d]}},customMessage:function(a,b){var c=this.settings.messages[a];return c&&(c.constructor==String?c:c[b])},findDefined:function(){for(var a=0;a<arguments.length;a++)if(arguments[a]!==undefined)return arguments[a]},defaultMessage:function(b,d){return this.findDefined(this.customMessage(b.name,d),this.customMetaMessage(b,d),!this.settings.ignoreTitle&&b.title||undefined,a.validator.messages[d],"<strong>Warning: No message defined for "+b.name+"</strong>")},formatAndAdd:function(a,b){var c=this.defaultMessage(a,b.method),d=/\$?\{(\d+)\}/g;typeof c=="function"?c=c.call(this,b.parameters,a):d.test(c)&&(c=jQuery.format(c.replace(d,"{$1}"),b.parameters)),this.errorList.push({message:c,element:a}),this.errorMap[a.name]=c,this.submitted[a.name]=c},addWrapper:function(a){return this.settings.wrapper&&(a=a.add(a.parent(this.settings.wrapper))),a},defaultShowErrors:function(){for(var a=0;this.errorList[a];a++){var b=this.errorList[a];this.settings.highlight&&this.settings.highlight.call(this,b.element,this.settings.errorClass,this.settings.validClass),this.showLabel(b.element,b.message)}this.errorList.length&&(this.toShow=this.toShow.add(this.containers));if(this.settings.success)for(a=0;this.successList[a];a++)this.showLabel(this.successList[a]);if(this.settings.unhighlight){a=0;for(b=this.validElements();b[a];a++)this.settings.unhighlight.call(this,b[a],this.settings.errorClass,this.settings.validClass)}this.toHide=this.toHide.not(this.toShow),this.hideErrors(),this.addWrapper(this.toShow).show()},validElements:function(){return this.currentElements.not(this.invalidElements())},invalidElements:function(){return a(this.errorList).map(function(){return this.element})},showLabel:function(b,d){var e=this.errorsFor(b);e.length?(e.removeClass(this.settings.validClass).addClass(this.settings.errorClass),e.attr("generated")&&e.html(d)):(e=a("<"+this.settings.errorElement+"/>").attr({"for":this.idOrName(b),generated:!0}).addClass(this.settings.errorClass).html(d||""),this.settings.wrapper&&(e=e.hide().show().wrap("<"+this.settings.wrapper+"/>").parent()),this.labelContainer.append(e).length||(this.settings.errorPlacement?this.settings.errorPlacement(e,a(b)):e.insertAfter(b))),!d&&this.settings.success&&(e.text(""),typeof this.settings.success=="string"?e.addClass(this.settings.success):this.settings.success(e)),this.toShow=this.toShow.add(e)},errorsFor:function(b){var d=this.idOrName(b);return this.errors().filter(function(){return a(this).attr("for")==d})},idOrName:function(a){return this.groups[a.name]||(this.checkable(a)?a.name:a.id||a.name)},validationTargetFor:function(a){return this.checkable(a)&&(a=this.findByName(a.name).not(this.settings.ignore)[0]),a},checkable:function(a){return/radio|checkbox/i.test(a.type)},findByName:function(b){var d=this.currentForm;return a(document.getElementsByName(b)).map(function(a,c){return c.form==d&&c.name==b&&c||null})},getLength:function(b,d){switch(d.nodeName.toLowerCase()){case"select":return a("option:selected",d).length;case"input":if(this.checkable(d))return this.findByName(d.name).filter(":checked").length}return b.length},depend:function(a,b){return this.dependTypes[typeof a]?this.dependTypes[typeof a](a,b):!0},dependTypes:{"boolean":function(a){return a},string:function(b,d){return!!a(b,d.form).length},"function":function(a,b){return a(b)}},optional:function(b){return!a.validator.methods.required.call(this,a.trim(b.value),b)&&"dependency-mismatch"},startRequest:function(a){this.pending[a.name]||(this.pendingRequest++,this.pending[a.name]=!0)},stopRequest:function(b,d){this.pendingRequest--,this.pendingRequest<0&&(this.pendingRequest=0),delete this.pending[b.name],d&&this.pendingRequest==0&&this.formSubmitted&&this.form()?(a(this.currentForm).submit(),this.formSubmitted=!1):!d&&this.pendingRequest==0&&this.formSubmitted&&(a(this.currentForm).triggerHandler("invalid-form",[this]),this.formSubmitted=!1)},previousValue:function(b){return a.data(b,"previousValue")||a.data(b,"previousValue",{old:null,valid:!0,message:this.defaultMessage(b,"remote")})}},classRuleSettings:{required:{required:!0},email:{email:!0},url:{url:!0},date:{date:!0},dateISO:{dateISO:!0},dateDE:{dateDE:!0},number:{number:!0},numberDE:{numberDE:!0},digits:{digits:!0},creditcard:{creditcard:!0}},addClassRules:function(b,d){b.constructor==String?this.classRuleSettings[b]=d:a.extend(this.classRuleSettings,b)},classRules:function(b){var d={};return(b=a(b).attr("class"))&&a.each(b.split(" "),function(){this in a.validator.classRuleSettings&&a.extend(d,a.validator.classRuleSettings[this])}),d},attributeRules:function(b){var d={};b=a(b);for(var e in a.validator.methods){var f;(f=e==="required"&&typeof a.fn.prop=="function"?b.prop(e):b.attr(e))?d[e]=f:b[0].getAttribute("type")===e&&(d[e]=!0)}return d.maxlength&&/-1|2147483647|524288/.test(d.maxlength)&&delete d.maxlength,d},metadataRules:function(b){if(!a.metadata)return{};var d=a.data(b.form,"validator").settings.meta;return d?a(b).metadata()[d]:a(b).metadata()},staticRules:function(b){var d={},e=a.data(b.form,"validator");return e.settings.rules&&(d=a.validator.normalizeRule(e.settings.rules[b.name])||{}),d},normalizeRules:function(b,d){return a.each(b,function(e,f){if(f===!1)delete b[e];else if(f.param||f.depends){var g=!0;switch(typeof f.depends){case"string":g=!!a(f.depends,d.form).length;break;case"function":g=f.depends.call(d,d)}g?b[e]=f.param!==undefined?f.param:!0:delete b[e]}}),a.each(b,function(e,f){b[e]=a.isFunction(f)?f(d):f}),a.each(["minlength","maxlength","min","max"],function(){b[this]&&(b[this]=Number(b[this]))}),a.each(["rangelength","range"],function(){b[this]&&(b[this]=[Number(b[this][0]),Number(b[this][1])])}),a.validator.autoCreateRanges&&(b.min&&b.max&&(b.range=[b.min,b.max],delete b.min,delete b.max),b.minlength&&b.maxlength&&(b.rangelength=[b.minlength,b.maxlength],delete b.minlength,delete b.maxlength)),b.messages&&delete b.messages,b},normalizeRule:function(b){if(typeof b=="string"){var d={};a.each(b.split(/\s/),function(){d[this]=!0}),b=d}return b},addMethod:function(b,d,e){a.validator.methods[b]=d,a.validator.messages[b]=e!=undefined?e:a.validator.messages[b],d.length<3&&a.validator.addClassRules(b,a.validator.normalizeRule(b))},methods:{required:function(b,d,e){if(!this.depend(e,d))return"dependency-mismatch";switch(d.nodeName.toLowerCase()){case"select":return(b=a(d).val())&&b.length>0;case"input":if(this.checkable(d))return this.getLength(b,d)>0;default:return a.trim(b).length>0}},remote:function(b,d,e){if(this.optional(d))return"dependency-mismatch";var f=this.previousValue(d);this.settings.messages[d.name]||(this.settings.messages[d.name]={}),f.originalMessage=this.settings.messages[d.name].remote,this.settings.messages[d.name].remote=f.message,e=typeof e=="string"&&{url:e}||e;if(this.pending[d.name])return"pending";if(f.old===b)return f.valid;f.old=b;var g=this;this.startRequest(d);var h={};return h[d.name]=b,a.ajax(a.extend(!0,{url:e,mode:"abort",port:"validate"+d.name,dataType:"json",data:h,success:function(e){g.settings.messages[d.name].remote=f.originalMessage;var h=e===!0;if(h){var i=g.formSubmitted;g.prepareElement(d),g.formSubmitted=i,g.successList.push(d),g.showErrors()}else i={},e=e||g.defaultMessage(d,"remote"),i[d.name]=f.message=a.isFunction(e)?e(b):e,g.showErrors(i);f.valid=h,g.stopRequest(d,h)}},e)),"pending"},minlength:function(b,d,e){return this.optional(d)||this.getLength(a.trim(b),d)>=e},maxlength:function(b,d,e){return this.optional(d)||this.getLength(a.trim(b),d)<=e},rangelength:function(b,d,e){return b=this.getLength(a.trim(b),d),this.optional(d)||b>=e[0]&&b<=e[1]},min:function(a,b,c){return this.optional(b)||a>=c},max:function(a,b,c){return this.optional(b)||a<=c},range:function(a,b,c){return this.optional(b)||a>=c[0]&&a<=c[1]},email:function(a,b){return this.optional(b)||/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(a)},url:function(a,b){return this.optional(b)||/^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(a)},date:function(a,b){return this.optional(b)||!/Invalid|NaN/.test(new Date(a))},dateISO:function(a,b){return this.optional(b)||/^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(a)},number:function(a,b){return this.optional(b)||/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(a)},digits:function(a,b){return this.optional(b)||/^\d+$/.test(a)},creditcard:function(a,b){if(this.optional(b))return"dependency-mismatch";if(/[^0-9 -]+/.test(a))return!1;var c=0,d=0,e=!1;a=a.replace(/\D/g,"");for(var f=a.length-1;f>=0;f--)d=a.charAt(f),d=parseInt(d,10),e&&(d*=2)>9&&(d-=9),c+=d,e=!e;return c%10==0},accept:function(a,b,c){return c=typeof c=="string"?c.replace(/,/g,"|"):"png|jpe?g|gif",this.optional(b)||a.match(RegExp(".("+c+")$","i"))},equalTo:function(b,d,e){return e=a(e).unbind(".validate-equalTo").bind("blur.validate-equalTo",function(){a(d).valid()}),b==e.val()}}}),a.format=a.validator.format})(jQuery),function(a){var b={};if(a.ajaxPrefilter)a.ajaxPrefilter(function(a,c,d){c=a.port,a.mode=="abort"&&(b[c]&&b[c].abort(),b[c]=d)});else{var c=a.ajax;a.ajax=function(d){var e=("port"in d?d:a.ajaxSettings).port;return("mode"in d?d:a.ajaxSettings).mode=="abort"?(b[e]&&b[e].abort(),b[e]=c.apply(this,arguments)):c.apply(this,arguments)}}}(jQuery),function(a){!jQuery.event.special.focusin&&!jQuery.event.special.focusout&&document.addEventListener&&a.each({focus:"focusin",blur:"focusout"},function(b,d){function e(b){return b=a.event.fix(b),b.type=d,a.event.handle.call(this,b)}a.event.special[d]={setup:function(){this.addEventListener(b,e,!0)},teardown:function(){this.removeEventListener(b,e,!0)},handler:function(b){return arguments[0]=a.event.fix(b),arguments[0].type=d,a.event.handle.apply(this,arguments)}}}),a.extend(a.fn,{validateDelegate:function(b,d,e){return this.bind(d,function(d){var f=a(d.target);if(f.is(b))return e.apply(f,arguments)})}})}(jQuery)