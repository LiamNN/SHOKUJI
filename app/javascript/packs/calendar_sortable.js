import Sortable from 'sortablejs';
import Rails from "@rails/ujs";

document.addEventListener('turbolinks:load', () => {
  const favoriteRecipes = document.getElementById("favorite-recipes");
  if (favoriteRecipes) {
    Sortable.create(favoriteRecipes, {
      animation: 200,
      group: {
        name: "shared",
        pull: "clone",
        put: false,
      }
    });
  }

  document.querySelectorAll(".recipe-slot").forEach(element => {
    Sortable.create(element, {
      group: "shared",
      pull: "clone",
      sort: false,
      onAdd: function (e, ui) {
        let formData = new FormData()
        formData.append('scheduled_recipe[scheduled_date]', this.el.dataset.date)
        formData.append('scheduled_recipe[time_of_day]', this.el.dataset.time)

        Rails.ajax({
          headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
          },
          url: e.item.dataset.url,
          type: "post",
          data: formData,
          success: function (data) {
            console.log(data)
          },
          error: function (data) {
          }
        })
      }
    });
  });
});
