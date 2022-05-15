function load_effect() {
  var element = document.getElementsByClassName('load-fade');
  if(!element) return;

  for(var i = 0; i < element.length; i++) {
    element[i].classList.add('is-show');
  }
}
setTimeout(load_effect, 600);