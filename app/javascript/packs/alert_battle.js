$(() => {
  function flash(message) {
    const flash_box = $('<div>').attr({
      class: "alert alert-danger m-2",
    });
    flash_box.text(message);
    $("#flash").empty();
    $("#flash").append(flash_box);
    setTimeout(() => { flash_box.remove() }, 5000);
  }

  const menu_battle = $(".js-menu-battle");
  menu_battle.on('click', function() {
    if(document.querySelector(".js-main_monster") === null) {
      flash("モンスターまたは、マイページからメインモンスターを登録してください");
    }
  });
});