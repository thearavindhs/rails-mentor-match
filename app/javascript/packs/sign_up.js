function continueBtn(userType){
  let step = 1;

  document.querySelectorAll(".back-btn").forEach((button) => {
    button.addEventListener("click", (event) => {
      event.preventDefault();
      if (step === 2) {
        step = 1;
        firstPartShown();
      } else if(step === 3){
        step = 2;
        secondPartShown(userType);
      }
    });
  });

  document.querySelectorAll(".continue-btn").forEach((button) => {
    button.addEventListener("click", (event) => {
      event.preventDefault();
      if (step === 1) {
        step = 2;
        secondPartShown(userType);
      } else if(step === 2){
        step = 3;
        thirdPartShown(userType);
      }
    });
  });
}

function firstPartShown(){
  document.querySelector(".create-an-account-form").hidden = false;
  document.querySelector(".personal-info-form").hidden = true;
  document.querySelector(".preferences-form").hidden = true;
}

function secondPartShown(userType){
  document.querySelector(".create-an-account-form").hidden = true;
  document.querySelector(".personal-info-form").hidden = false;
  document.querySelector(".preferences-form").hidden = true;
  if (userType == "mentor") {
    document.querySelector(".mentor-personal-form").hidden = false;
  } else {
    document.querySelector(".mentor-personal-form").hidden = true;
  }
}

function thirdPartShown(userType){
  document.querySelector(".create-an-account-form").hidden = true;
  document.querySelector(".personal-info-form").hidden = true;
  document.querySelector(".preferences-form").hidden = false;
  if (userType == "mentor") {
    document.querySelector(".mentee-preferences").hidden = true;
  } else {
    document.querySelector(".mentee-preferences").hidden = false;
  }
}


function main(){
  firstPartShown();

  let userType;
  if(document.querySelector(".mentor") == null){
    userType = "mentee";
  } else {
    userType = "mentor";
  }
  continueBtn(userType);
}
main();

// document.addEventListener("DOMContentLoaded", () => {
//   setInterval(main(), 1000); // Every 1 second, the `refresh` function is called.
// });
