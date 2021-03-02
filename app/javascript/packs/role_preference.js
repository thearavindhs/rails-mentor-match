document.querySelector(".user_role_preference").hidden = true;
const input = document.querySelector("#user_role_preference")
input.value = "Tech";

const cards = document.querySelectorAll(".role-card");

cards.forEach((card) => {
  card.style.cursor = "pointer"
  card.addEventListener("click",(event) => {
    console.log("I was clicked");
  });
});

