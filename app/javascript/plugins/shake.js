const removeShake = () => {
  const bellContainer = document.querySelector(".dropdown-toggle")
  const bell = document.querySelector(".fa-bell")
  bellContainer.addEventListener('click', (e) => {
    console.log('click');
    bell.classList.remove("shake-constant");
    bell.classList.remove("shake-rotate");
  });
}

export { removeShake };
