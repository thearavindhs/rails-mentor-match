const cards = document.querySelectorAll(".role-card");
const inputMaxMentee = document.querySelector("#user_maximum_mentee");
const inputExperience = document.querySelector("#user_experience_preference");


if (inputMaxMentee === null) {
  // Not maximum mentee input.

  //  ------------ Mentee Form --------------
  inputExperience.hidden = true;
  document.querySelector(".user_experience_preference").hidden = true;

  inputExperience.value = "0-5 YEARS"; // Default Value

  cards.forEach((card) => {
    card.addEventListener("click", (event) => {
      card.childNodes[1].childNodes[1].classList.replace("role-name-large", "role-name-large-active");
      event.preventDefault();
      inputExperience.value = card.childNodes[1].innerText;
    });
  });



} else if(inputExperience === null) {
  // // Not experience input.

  //  ------------ Mentor Form --------------
  inputMaxMentee.hidden = true;
  document.querySelector(".user_maximum_mentee").hidden = true;

  cards.forEach((card) => {
    card.addEventListener("click", (event) => {
      event.preventDefault();
      card.childNodes[1].childNodes[1].classList.replace("role-name-large", "role-name-large-active");
      let text = card.childNodes[1].innerText;
      if (text == "1 MENTEE") {
        inputMaxMentee.value = 1;
      } else if (text == "2 MENTEES") {
        inputMaxMentee.value = 2;
      } else {
        inputMaxMentee.value = 3;
      }

      console.log(`Input -> ${inputMaxMentee.value}`);

    });
  });




}



