$(function() {
  $(".search").submit(function(event) {
      var input = $(this).find("input")
      var term  = input.val()

      if (term.length < 3) {
        input.addClass("error")
      } else {
        input.removeClass("error")
        window.location = "/search?term=" + term
      }
      event.preventDefault();
    })
});