document.querySelectorAll(".like-icon").forEach(element => {
  element.addEventListener('click', () => {
    element.classList.toggle('red');
  }, false);
});
