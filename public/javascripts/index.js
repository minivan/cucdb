$(function() {
  $(".search").submit(function(event) {
      var input = $(this).find("input")
      var term  = input.val()

      if (term.length < 3) {
        input.addClass("error")
      } else {
        var stateObj = { term: term, page: 0 };
        $.post("/search", stateObj)
          .done(function(result_html) {
              $("#results").html(result_html)
              history.pushState(stateObj, "Căutare: " + term, "/search?term=" + term);
          })
        input.removeClass("error")
      }
      event.preventDefault();
    })
});