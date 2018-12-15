$(() => {
  function flash(message, type = "success") {
    const flash_box = $('<div>').attr({
      class: `alert alert-${type} m-2`,
    });
    flash_box.text(message);
    $("#flash").append(flash_box);
    setTimeout(() => { flash_box.remove() }, 5000);
  }

  $('input[type=file]').change(function() {
    const $form = $(".js-monster-form");
    $form.submit();
  });
});