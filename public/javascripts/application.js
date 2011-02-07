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

    // twitter
    $.getJSON("http://twitter.com/statuses/user_timeline/kscios.json?callback=?", function(tweets) {
        $.each(tweets, function(i, tweet){
            if (i < 3) {
                $("ul#tweets").append("<li> <strong>" + linkify("@" + tweet.user.screen_name) + "</strong>: " + linkify(tweet.text) + "</li>");
            }
        });
    });

  // modified from TwitterGitter by David Walsh (davidwalsh.name)
  // courtesy of Jeremy Parrish (rrish.org)
  function linkify(text) {
    return text
      .replace(/(https?:\/\/[\w\-:;?&=+.%#\/]+)/gi, '<a href="$1">$1</a>')
      .replace(/(^|\W)@(\w+)/g, '$1<a href="http://twitter.com/$2">@$2</a>')
      .replace(/(^|\W)#(\w+)/g, '$1#<a href="http://search.twitter.com/search?q=%23$2">$2</a>')
  }
});

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};
