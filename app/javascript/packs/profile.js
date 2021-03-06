function openModal(){
  document.querySelector(".my-modal").classList.add("active");
  document.querySelector("#overlay").classList.add("active");
}
function closeModal(){
  document.querySelector(".my-modal").classList.remove("active");
  document.querySelector("#overlay").classList.remove("active");
}

function openModalBtnConfig(){
  const openModalBtn = document.querySelector(".open-modal-btn");
  if(openModalBtn !== null){
    openModalBtn.addEventListener("click", (event) => {
      event.preventDefault();
      openModal();
    });
  }
}

function closeModalBtnConfig(){
  const closeModalBtn = document.querySelector(".close-modal-btn");
  if(closeModalBtn !== null){
    closeModalBtn.addEventListener("click", (event) => {
      event.preventDefault();
      closeModal();
    });
  }
}

function visualNotice(){
  let container = document.querySelector(".copy-container");

  if(container === null){
    container = document.querySelector(".copy-container-active")
  }


  if(container.classList.contains("copy-container-active")){
    container.classList.remove("copy-container-active");
    container.classList.add("copy-container");
    console.log("remove class");
  } else {
    container.classList.remove("copy-container");
    container.classList.add("copy-container-active");
    console.log("add class");
  }
}

function copyBtnConfig(){
  const copyBtn = document.querySelector(".copy-cta");
  const email = document.getElementById('mentor-email');

  if (copyBtn !== null) {
    copyBtn.addEventListener("click", (event) => {
      event.preventDefault();
      let tempInput = document.createElement("input");
      tempInput.value = email.innerText;
      document.querySelector(".modal-body").appendChild(tempInput);
      tempInput.focus();
      tempInput.select();
      document.execCommand("copy");
      document.querySelector(".modal-body").removeChild(tempInput);
      visualNotice();
      setTimeout(() => {  visualNotice() }, 2000);
    });
  }
}

function main(){

  openModalBtnConfig();
  closeModalBtnConfig();
  copyBtnConfig();
}


main();
