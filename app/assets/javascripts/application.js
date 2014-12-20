//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

jQuery(function ($) {
    Turbolinks.enableProgressBar();

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

    $('form#new_comment').on('ajax:beforeSend', function(event, xhr, settings) {
        $(this).find("input[type=submit]").prop("disabled", true);
    });

    $('form#new_comment').on('ajax:complete', function(event, xhr, settings) {
        $(this).find("input[type=submit]").prop("disabled", false);
    });
});
