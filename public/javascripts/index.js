$(function() {
  $(".search").submit(function(event) {
      var input = $(this).find("input")
      var term  = input.val()

      if (term.length < 3) {
        input.addClass("error")
      } else {
        $.post("/search", { term: term })
          .done(function(result_html) {
              $("#results").html(result_html)
          })
        input.removeClass("error")
      }
      event.preventDefault();
    })
});