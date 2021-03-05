const cards = document.querySelectorAll(".role-card");

const rolePreference = document.querySelector("#user_role_preference");
const role = document.querySelector("#user_role");

function selectOneCard(selectedCard){
  // Only select one card. Remove active from all the other cards.
  cards.forEach((card) => {
    if (card === selectedCard) {
      card.childNodes[1].childNodes[1].classList.replace("role-name-large", "role-name-large-active");
      card.childNodes[1].childNodes[1].classList.replace("role-name-small", "role-name-small-active");
    } else {
      if(card.childNodes[1].childNodes[1].classList.contains("role-name-large-active") || card.childNodes[1].childNodes[1].classList.contains("role-name-small-active")){
        card.childNodes[1].childNodes[1].classList.replace("role-name-large-active", "role-name-large");
        card.childNodes[1].childNodes[1].classList.replace("role-name-small-active", "role-name-small");
      }
    }
  });
}



if (role === null) {
  // No role input.
  // Then, rolePreference is up.

  //  ------------ Mentee Form --------------
  rolePreference.hidden = true;
  document.querySelector(".user_role_preference").hidden = true;

  cards.forEach((card) => {
    card.style.cursor = 'pointer';
    card.addEventListener("click",(event) => {
      event.preventDefault();
      rolePreference.value = card.childNodes[1].innerText;
      // deactivateCards();
      console.log(`Input Role Preference -> ${rolePreference.value}`);
      selectOneCard(card);
    });
  });



} else if(rolePreference === null) {
  // No role Preference input.
  // Then, role is up.

  //  ------------ Mentor Form --------------
  role.hidden = true;
  document.querySelector(".user_role").hidden = true;

  cards.forEach((card) => {
    card.style.cursor = 'pointer';
    card.addEventListener("click", (event) => {
      event.preventDefault();
      role.value = card.childNodes[1].innerText;
      console.log(`Input Role -> ${role.value}`);
      selectOneCard(card);
    });
  });

}
