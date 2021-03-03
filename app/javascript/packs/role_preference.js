document.querySelector(".user_role_preference").hidden = true;
const inputForm = document.querySelector("#user_role_preference");

const cards = document.querySelectorAll(".role-card");

cards.forEach((card) => {
  card.addEventListener("click",(event) => {
    event.preventDefault();
    inputForm.value = card.childNodes[1].innerText;
    // deactivateCards();
    console.log(`Input -> ${inputForm.value}`);
    // card.childNodes[1].classList.replace("background-card-small", "background-card-small-active");
    card.childNodes[1].childNodes[1].classList.replace("role-name-large", "role-name-large-active");
    card.childNodes[1].childNodes[1].classList.replace("role-name-small", "role-name-small-active");
  });
});
