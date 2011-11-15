// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//= require jquery-ui

// jQuery.ajaxSetup({ 
//   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
// })

// jQuery.fn.submitWithAjax = function() {
//   this.submit(function() {
//     $.post(this.action, $(this).serialize(), null, "script");
//     return false;
//   })
//   return this;
// };

$(function() {
  $("#task_due").datepicker({ numberOfMonths: [1, 2] });
  // $('#modal-from-dom').bind('show', function () {
  //     console.log("will display");
  // });
  // $('#new_folder').bind('show', function () {
  //   console.log("show now");
  // });
  //$("#new_task").submitWithAjax();
  $('#manage_folders_modal').modal({
      backdrop: true,
      keyboard: true
  });
  
  $('#manage_folders_modal > .modal-footer > .btn').click(function(){
      $('#manage_folders_modal').modal('hide');
      return false;
  });
  
  $('#add_task_button').click(function(){
      var pass = true;
      $('#new_task .task_form_error_message').remove();
      if (!checkRequiredValue($('#task_name'))) {          
          displayError($('#task_name'), "Task name is required.");
          pass = false;
      }
      if (!checkRequiredValue($('#task_due'))) {

          displayError($('#task_due'), "Task due date is required.");
          pass = false;
      } else if (!checkDate($('#task_due'))) {

          displayError($('#task_due'), "The valid date format is mm/dd/yyyy.");
          pass = false;
      }
      return pass;
  });
  
  // $('.delete_task').bind('ajax:success', function() {  
  //     $(this).closest('.task').animate({ height: 'toggle', opacity: 'toggle' }, 200);
  // });
  // $('.complete_task').bind('ajax:success', function() {  
  //     $(this).closest('.task').animate({ height: 'toggle', opacity: 'toggle' }, 200);
  // });
  
});

function checkRequiredValue(field) {
    if(field.val())
        return true;
    else
        return false;
}

function checkDate(field) {
    var pattern = "^[0-9]{2}/[0-9]{2}/[0-9]{4}$";
    var regExp = new RegExp(pattern,"");
    return regExp.test(field.val());
}

function displayError(field, message) {
    var errorDiv = '<div class="task_form_error_message">' + message + '</div>';

    field.after(errorDiv);
}
