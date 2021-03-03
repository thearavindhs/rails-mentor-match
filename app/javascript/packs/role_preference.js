document.querySelector(".user_role_preference").hidden = true;
const inputForm = document.querySelector("#user_role_preference")

const cards = document.querySelectorAll(".role-card");

cards.forEach((card) => {
  card.addEventListener("click",(event) => {
    event.preventDefault();
    inputForm.value = card.childNodes[1].innerText;
    // deactivateCards();
    console.log(`Input -> ${inputForm.value}`);
    // card.childNodes[1].classList.replace("background-card-small", "background-card-small-active");
  });
});

// function deactivateCards(){
//   // CurrentTarget is the complete card.
//   cards.forEach((card) => {
//     if (card.childNodes[1].classList.contains("")) {}
//   });
// }
