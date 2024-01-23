<?php
use yii\helpers\Html;
use yii\helpers\Url;
?>

<div class="row">
  <div class="d-flex justify-content-center">
    <div class="col-lg-6 text-center mt-3 mb-3">
      <h2>Encuentra tu próxima reserva: </h2>
      <?= Html::beginForm(Url::to(['busqueda-filtrada']), 'get'); ?>
        <div class="input-group">
          <?= Html::input('text', 'palabrasClave', null, ['class' => 'form-control', 'placeholder' => 'Sushi Sibuya Zamora...']) ?>
          <span class="input-group-btn">
            <?= Html::submitButton('Buscar', ['class' => 'btn btn-primary btn-lg']) ?>
          </span>
        </div>
      <?= Html::endForm(); ?>
    </div>
  </div>
</div>