$(() => {
  function flash(message) {
    const flash_box = $('<div>').attr({
      class: "alert alert-success m-2",
    });
    flash_box.text(message);
    $("#flash").append(flash_box);
    setTimeout(() => { flash_box.remove() }, 5000);
  }

  $(".js_deside-monster").on("click", (e) => {
    monster_id = e.target.value;
    $.ajax({
      url:'/api/v1/main_monsters',
      type:'POST',
      data:{
        monster_id,
        authenticity_token: $('[name="csrf-token"]')[0].content,
      }
    }).done(() => {
      $(`#monster_${monster_id}`).modal('hide');
      flash('メインを設定しました');
      $(".js_new-text").text('メインモンスターを変更する');
      $.each($(".js-select-monster"), function(index, element) {
        $(element).removeClass("monster-select");
      });
      $(`.js-monster-${monster_id}`).addClass("monster-select");
    });
  })
});