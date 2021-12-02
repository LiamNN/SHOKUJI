import Sortable from 'sortablejs';
import Rails from "@rails/ujs";

document.addEventListener('turbolinks:load', () => {
  const favoriteRecipes = document.getElementById("favorite-recipes");
  Sortable.create(favoriteRecipes, {
    animation: 200,
    group: {
      name: "shared",
      pull: "clone",
      put: false,
    }
  });

  document.querySelectorAll(".recipe-slot").forEach(element => {
    Sortable.create(element, {
      group: "shared",
      pull: "clone",
      sort: false,
      onAdd: function (e, ui) {
        let formData = new FormData()
        formData.append('scheduled_date', $(this.el).data('date'))
        formData.append('recipe_id', $(e.item).data('recipe'))
        formData.append('time_of_day', $(this.el).data('time'))

        Rails.ajax({
          url: $(this.el).data('url'),
          type: "post",
          data: formData,
          success: function (data) {
          },
          error: function (data) {
          }
        })
      }
    });
  });
});
