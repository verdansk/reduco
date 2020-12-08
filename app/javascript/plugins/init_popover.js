const initPopover = () => {
  const cards = document.querySelectorAll(".challenge-card-mini")
  console.log(cards)

  cards.forEach(card => {
      card.addEventListener("click", (event) => {
        $(`#${event.currentTarget.id}`).popover()
        $('.popover-dismiss').popover({
  trigger: 'focus'
})
    })
  })

}

export { initPopover }
