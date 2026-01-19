// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Javascript for our mood submission form
document.addEventListener("turbo:load", () => {
    const moodField = document.querySelector("#mood-field");
    const buttons = document.querySelectorAll(".mood-face");
    if (!moodField || buttons.length === 0) return;
  
    buttons.forEach((btn) => {
      btn.addEventListener("click", () => {
        buttons.forEach((b) => b.classList.remove("active"));
        btn.classList.add("active");
        moodField.value = btn.dataset.mood;
      });
    });
  });
  