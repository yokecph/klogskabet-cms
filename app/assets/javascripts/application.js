// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree .

// Rails wraps inputs with failed validations in a div.field_with_errors element
// but Bootstrap's validation error class has to be added higher up in the
// heirarchy so do that on load
$(function () {
 $('.field_with_errors').each(function () {
   $(this).closest('.form-group').addClass('has-error');
 });
});
