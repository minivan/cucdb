$(function() {
  $(".search").submit(function(event) {
      var term = $(this).find("input").val()
      $.post("/search", { term: term })
        .done(function(result_html) {
            $("#results").html(result_html)
          })
      event.preventDefault();
    })
});