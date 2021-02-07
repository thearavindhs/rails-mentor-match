function continueBtnConfig(step){

  document.querySelector(".continue-btn").addEventListener("click", (event) => {
    event.preventDefault();
    step += 1 ;
  });
  return step;
}

function firstPartShown(){
  document.querySelector(".create-an-account-form").hidden = false;
  document.querySelector(".personal-info-form").hidden = true;
}

function secondPartShown(){
  document.querySelector(".create-an-account-form").hidden = true;
  document.querySelector(".personal-info-form").hidden = false;
}

function main(){
  let userType;
  let step = 1;
  step = continueBtnConfig(step);

  if(document.querySelector(".mentor") == null){
    userType = "mentee";
  } else {
    userType = "mentor";
  }

  if (step == 1) {
    firstPartShown();
  } else if(step == 2) {
    secondPartShown();
  }
}

main();
