$(() => {
  $(".js_strong-noguchi-button").on('click', function (event) {
    $(".js_world-noguchi").addClass("d-none")
    $(".js_strong-noguchi").removeClass("d-none")
    $(".js_strong-noguchi-button").addClass("d-none")
    $(".js_world-noguchi-button").removeClass("d-none")
  });

  $(".js_world-noguchi-button").on('click', function (event) {
    $(".js_strong-noguchi").addClass("d-none")
    $(".js_world-noguchi").removeClass("d-none")
    $(".js_world-noguchi-button").addClass("d-none")
    $(".js_strong-noguchi-button").removeClass("d-none")
  });
});