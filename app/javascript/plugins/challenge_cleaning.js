const challengeCleaning = () => {
  const hideListItem = document.querySelectorAll("#challenge-card-item");
  hideListItem.forEach((item) => {
    if (item.innerText === "") {
    item.classList.add("hide")
    };
  });
};

export { challengeCleaning }
