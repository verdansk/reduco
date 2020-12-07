const removeShake = () => {
  const bellContainer = document.querySelector(".dropdown-toggle")
  const bell = document.querySelector(".fa-bell")
  if (bellContainer){
    bellContainer.addEventListener('click', (e) => {
    bell.classList.remove("shake-constant");
    bell.classList.remove("shake-rotate");
  });
  }
}

export { removeShake };
