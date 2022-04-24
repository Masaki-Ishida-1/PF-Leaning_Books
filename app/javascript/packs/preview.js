if (document.URL.match(/edit/,/new/)){
  document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('book_book_image').addEventListener('change', (e) =>{
      console.log(e);
    });
  });
}