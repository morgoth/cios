//railscasts dynamic comments
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery(function($) {
    $("input#user_session_login").focus();

    $("#new_comment").submitWithAjax();

    // opening links in separate window
    $("a[data-popup=true]").each(function(i, element) {
        $(element).click(function (event) {
            window.open(element.href);
            event.preventDefault();
        });
    });
});

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};
