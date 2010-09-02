//railscasts dynamic comments
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(
  function()
  {
    $("input#user_session_login").focus();
    $(".sponsors-sort").sortable({
        handle: ".handle",
        update: function(event, ui) {
          $.post('sponsors/sort', $(this).sortable('serialize'), null, "script");
        }
      });
    $("#new_comment").submitWithAjax();
  }
);

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};
