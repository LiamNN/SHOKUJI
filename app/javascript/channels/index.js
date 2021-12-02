// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const goals = document.querySelectorAll('.clickable');

const toggleActiveClass = (event) => {
  event.currentTarget.classList.toggle('active');
};

const toggleActiveOnClick = (goal) => {
  goal.addEventListener('click', toggleActiveClass);
};

goals.forEach(toggleActiveOnClick);
