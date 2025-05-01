window.addEventListener("load", (_) => {
    const tuoBottone = document.getElementById("back-top");
    function HandleScroll() {
        if (window.scrollY <= 250) {
            tuoBottone.style.display = 'none';
        } else {
            tuoBottone.style.display = 'block';
        }
    }
     window.addEventListener("scroll", HandleScroll);
    HandleScroll();
});
  