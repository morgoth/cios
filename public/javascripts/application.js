  $(document).ready(
  function()
  {
    $("input#user_session_login").focus();
		
		$("#new_comment").submitWithAjax();
  }
  );
	

//railscasts dynamic comments
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};
