$(() => {
  const $form = $(".js-monster-form");
  const $loading = $(".js-loading");
  $form.on("change", () => {
    $form.submit();
    $loading.removeClass("d-none");
  })
});