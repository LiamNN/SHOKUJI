// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// Default SortableJS

import { calendarSortable } from './calendar_sortable';

// // Core SortableJS (without default plugins)
// import Sortable from 'sortablejs/modular/sortable.core.esm.js';

// // Complete SortableJS (with all plugins)
// import Sortable from 'sortablejs/modular/sortable.complete.esm.js';

// // Cherrypick extra plugins
// import Sortable, { MultiDrag, Swap } from 'sortablejs';

// Sortable.mount(new MultiDrag(), new Swap());


// // Cherrypick default plugins
// import Sortable, { AutoScroll } from 'sortablejs/modular/sortable.core.esm.js';

// Sortable.mount(new AutoScroll());

import { initStarRating } from '../plugins/init_star_rating';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initStarRating();
  calendarSortable();

  // });
});
