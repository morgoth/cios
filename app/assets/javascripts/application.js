// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery(function ($) {
    // opening links in separate window
    $("a[data-popup=true]").each(function (i, element) {
        $(element).click(function (event) {
            window.open(element.href);
            event.preventDefault();
        });
    });

    // twitter
    // $.getJSON("http://twitter.com/statuses/user_timeline/kscios.json?callback=?", function(tweets) {
        // $.each(tweets, function(i, tweet){
            // if (i < 3) {
                // $("ul#tweets").append("<li> <strong>" + linkify("@" + tweet.user.screen_name) + "</strong>: " + linkify(tweet.text) + "</li>");
            // }
        // });
    // });

    // modified from TwitterGitter by David Walsh (davidwalsh.name)
    // courtesy of Jeremy Parrish (rrish.org)
    function linkify(text) {
        return text
            .replace(/(https?:\/\/[\w\-:;?&=+.%#\/]+)/gi, '<a href="$1">$1</a>')
            .replace(/(^|\W)@(\w+)/g, '$1<a href="http://twitter.com/$2">@$2</a>')
            .replace(/(^|\W)#(\w+)/g, '$1#<a href="http://search.twitter.com/search?q=%23$2">$2</a>');
    }

    $('#menu a').pjax("#content");

    $('form#new_comment').live('ajax:beforeSend', function(event, xhr, settings) {
        $(this).find("input[type=submit]").attr("disabled", true)
    });

    $('form#new_comment').live('ajax:complete', function(event, xhr, settings) {
        $(this).find("input[type=submit]").attr("disabled", false)
    });
});
