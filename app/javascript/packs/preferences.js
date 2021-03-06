const cards = document.querySelectorAll(".role-card");
const inputMaxMentee = document.querySelector("#user_maximum_mentee");
const inputExperience = document.querySelector("#user_experience_preference");


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

if (inputMaxMentee === null) {
  // Not maximum mentee input.

  //  ------------ Mentee Form --------------
  inputExperience.hidden = true;
  document.querySelector(".user_experience_preference").hidden = true;

  inputExperience.value = "0-5 YEARS"; // Default Value

  cards.forEach((card) => {
    card.addEventListener("click", (event) => {
      selectOneCard(card);
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
      selectOneCard(card);
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



