document.addEventListener("DOMContentLoaded", () => {

    const yearSpan = document.getElementById('year');
    if (yearSpan) {
      yearSpan.textContent = new Date().getFullYear();
    }
  
    document.querySelectorAll("img").forEach(img => {
      img.addEventListener("click", (e) => {
        img.classList.toggle("fullscreen-img");
        e.stopPropagation(); // Prevent bubbling to avoid accidental toggling
      });
    });
  });
  