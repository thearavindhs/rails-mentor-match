document.querySelector(".text-info-mentor").hidden = true;
document.querySelector(".text-info-mentee").hidden = true;



// Card for Mentor.
// When the user hovers over the card, the text will be shown and the images are not.
document.querySelector(".cardMentor").addEventListener("mouseenter", (event) => {
  document.querySelector(".text-info-mentor").hidden = false;
  document.querySelector(".images-mentor").hidden = true;
});
document.querySelector(".cardMentor").addEventListener("mouseleave", (event) => {
  document.querySelector(".text-info-mentor").hidden = true;
  document.querySelector(".images-mentor").hidden = false;
});



// Card for Mentee.
// Same thing here.
document.querySelector(".cardMentee").addEventListener("mouseenter", (event) => {
  document.querySelector(".text-info-mentee").hidden = false;
  document.querySelector(".images-mentee").hidden = true;
});
document.querySelector(".cardMentee").addEventListener("mouseleave", (event) => {
  document.querySelector(".text-info-mentee").hidden = true;
  document.querySelector(".images-mentee").hidden = false;
});
