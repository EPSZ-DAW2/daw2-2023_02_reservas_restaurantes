<?php
use yii\helpers\Html;
?>

<div class="d-flex justify-content-center align-items-center">
  <table class="table w-50">
    <tr class="row">
      <td class="col">
        <?= Html::a('Categorias', ['/admin-categorias'], ['class' => 'btn btn-primary w-100']) ?>
      </td>
    </tr>
    <tr class="row">
      <td class="col">
        <?= Html::a('FAQ', ['/admin-faq'], ['class' => 'btn btn-primary w-100']) ?>
      </td>
    </tr>
    <tr class="row">
      <td class="col">
        <?= Html::a('Imagenes', ['/admin-imagenes'], ['class' => 'btn btn-primary w-100']) ?>
      </td>
    </tr>
  </table>
</div>
