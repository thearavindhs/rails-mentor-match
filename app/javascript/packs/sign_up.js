function continueBtnConfig(userType){
  document.querySelector(".continue-btn").addEventListener("click", (event) => {
    event.preventDefault();
    secondPartShown(userType);
    console.log(`Continue was clicked`);
  });
}

function backBtnConfig(){
  document.querySelector(".back-btn").addEventListener("click", (event) => {
    event.preventDefault();
    firstPartShown();
    console.log(`Back was clicked`);
  });
}


function firstPartShown(){
  document.querySelector(".create-an-account-form").hidden = false;
  document.querySelector(".personal-info-form").hidden = true;
}

function secondPartShown(userType){
  document.querySelector(".create-an-account-form").hidden = true;
  document.querySelector(".personal-info-form").hidden = false;
  if (userType == "mentor") {
    console.log("Mentor part shown.");
    document.querySelector(".mentor-personal-form").hidden = false;
  } else {
    console.log("Mentee part shown.");
    document.querySelector(".mentor-personal-form").hidden = true;
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
  backBtnConfig();
  continueBtnConfig(userType);
}
main();

// document.addEventListener("DOMContentLoaded", () => {
//   setInterval(main(), 1000); // Every 1 second, the `refresh` function is called.
// });
