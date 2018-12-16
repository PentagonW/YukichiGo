import anime from 'animejs/anime'

$(() => {
  const information = document.querySelector(".js-battle-wild-monster-information");
  const result = document.querySelector(".js-battle-wild-winner");
  const noguchis = document.getElementsByClassName('.js-active-noguchi');
  setTimeout(() => {
    anime({
      targets: information,
      opacity: 0
    })
  }, 2000)

  setTimeout(() => {
    noguchis[0].classList.remove('d-none')
    noguchis[1].classList.remove('d-none')
  }, 2000)

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
