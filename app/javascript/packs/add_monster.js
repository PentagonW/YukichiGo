$(() => {
  const $form = $(".js-monster-form");
  $form.on("change", () => {
    $form.submit();
  })
});