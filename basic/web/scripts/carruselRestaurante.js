function inicializarCarruseles() {
  var carruselRestaurante = document.querySelectorAll(".carruselRestaurante");

  carruselRestaurante.forEach(function (instancia) {
    $(instancia).off('.bs.carousel');
    $(instancia).removeData('bs.carousel');

    $(instancia).find(".carousel-control-next").off("click");
    $(instancia).find(".carousel-control-prev").off("click");

    if (window.matchMedia("(min-width: 768px)").matches) {
      $(instancia).removeClass("slide");
      var carousel = new bootstrap.Carousel(instancia, {
        interval: false,
      });
      var carouselWidth = $(instancia).find(".carousel-inner")[0].scrollWidth;
      var cardWidth = $(instancia).find(".carousel-item").width();
      var scrollPosition = 0;
      $(instancia).find(".carousel-control-next").on("click", function () {
        if (scrollPosition < carouselWidth - cardWidth * 4) {
          scrollPosition += cardWidth;
          $(instancia).find(".carousel-inner").animate(
            { scrollLeft: scrollPosition },
            600
          );
        }
      });
      $(instancia).find(".carousel-control-prev").on("click", function () {
        if (scrollPosition > 0) {
          scrollPosition -= cardWidth;
          $(instancia).find(".carousel-inner").animate(
            { scrollLeft: scrollPosition },
            600
          );
        }
      });
    } else {
      $(instancia).addClass("slide");
    }
  });
}


inicializarCarruseles();
//se reinicializa el carrusel cuando se cambia el tamaño de la ventana
window.addEventListener('resize', inicializarCarruseles);