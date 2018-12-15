import anime from 'animejs/anime'

$(() => {
  const result = document.querySelector(".js-battle-winner");
  const noguchis = document.getElementsByClassName('active-noguchi')
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

  setTimeout(() => {
    anime({
      targets: noguchis,
      opacity: 0
    })
  }, 5000)

  if(result) {
    setTimeout(() => {
      result.classList.remove("d-none")
      anime({
        targets: result,
        opacity:[0,1],
        easing: 'easeInOutQuart'
      })
    }, 6000)
  }
})
