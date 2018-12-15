$(() => {
  const $form = $(".js-monster-form");
  const $loading = $(".js-loading");
  $form.on("change", () => {
    $form.submit();
    $("html").addClass("dark");
    $loading.removeClass("d-none");
  })
});
