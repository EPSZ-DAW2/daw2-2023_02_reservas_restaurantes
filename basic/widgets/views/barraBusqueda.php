<?php use yii\helpers\Html; ?>
<!-- Vista del widget para la barra de búsqueda simple -->
<div class="row">
  <div class="d-flex justify-content-center">
    <div class="col-lg-6 text-center">
      <h2>Encuentra tu próxima reserva: </h2>
      <form action="<?= Html::encode($url) ?>" method="get">
        <div class="input-group">
          <input type="text" class="form-control" name="palabrasClave" placeholder="Sushi Sibuya Zamora...">
          <span class="input-group-btn">
            <button class="btn btn-primary btn-lg" type="submit">Buscar</button>
          </span>
        </div>
      </form>
    </div>
  </div>
</div>
