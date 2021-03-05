
const cards = document.querySelectorAll(".role-card");

const rolePreference = document.querySelector("#user_role_preference");
const role = document.querySelector("#user_role");


if (role === null) {
  // No role input.
  // Then, rolePreference is up.

  //  ------------ Mentee Form --------------
  rolePreference.hidden = true;
  document.querySelector(".user_role_preference").hidden = true;

  cards.forEach((card) => {
    card.addEventListener("click",(event) => {
      event.preventDefault();
      rolePreference.value = card.childNodes[1].innerText;
      // deactivateCards();
      console.log(`Input Role Preference -> ${rolePreference.value}`);
      card.childNodes[1].childNodes[1].classList.replace("role-name-large", "role-name-large-active");
      card.childNodes[1].childNodes[1].classList.replace("role-name-small", "role-name-small-active");
    });
  });



} else if(rolePreference === null) {
  // No role Preference input.
  // Then, role is up.

  //  ------------ Mentor Form --------------
  role.hidden = true;
  document.querySelector(".user_role").hidden = true;

  cards.forEach((card) => {
    card.addEventListener("click", (event) => {
      event.preventDefault();
      role.value = card.childNodes[1].innerText;
      console.log(`Input Role -> ${role.value}`);
      card.childNodes[1].childNodes[1].classList.replace("role-name-large", "role-name-large-active");
      card.childNodes[1].childNodes[1].classList.replace("role-name-small", "role-name-small-active");

    });
  });

}
