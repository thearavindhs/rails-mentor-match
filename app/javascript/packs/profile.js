document.querySelector(".open-modal-btn").addEventListener("click", (event) => {
  event.preventDefault();
  openModal();
});
document.querySelector(".close-modal-btn").addEventListener("click", (event) => {
  event.preventDefault();
  closeModal();
});

function openModal(){
  document.querySelector(".my-modal").classList.add("active");
  document.querySelector("#overlay").classList.add("active");
}
function closeModal(){
  document.querySelector(".my-modal").classList.remove("active");
  document.querySelector("#overlay").classList.remove("active");
}
