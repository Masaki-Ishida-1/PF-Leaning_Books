window.addEventListener('load', (event) => {
  const collapseSide = document.querySelector('.collapseSide');
  document.addEventListener("click", (e) => {
    if(e.target.closest(".btn-side")) {
  		collapseSide.classList.contains("active") ? collapseSide.classList.remove("active") : collapseSide.classList.add("active");
  	} else {
  		collapseSide.classList.remove("active");
  	}
  });
});