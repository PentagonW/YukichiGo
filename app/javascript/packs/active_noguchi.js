$(() => {
noguchis = document.getElementsByClassName('active-noguchi')
setInterval(() => {
  Array.from(noguchis).forEach(noguchi => {
    let top = Math.random() * window.innerHeight * 0.8
    let right = Math.random() * window.innerWidth * 0.8
    $(noguchi).animate({
      top: top,
      right: right,
      }, 100)
   })
 }, 100)
})
