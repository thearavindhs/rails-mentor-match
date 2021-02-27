


function continue_btn(){
  document.querySelector(".continue-btn").addEventListener("click", (event) => {
    event.preventDefault();
    document.querySelector(".completeprofile-section").hidden = true;
    document.querySelector(".picture-form").hidden = false;
  });
};



function main(){
  document.querySelector(".picture-form").hidden = true;
  continue_btn();
};



main();
