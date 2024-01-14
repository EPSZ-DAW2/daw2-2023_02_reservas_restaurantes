<?php

/** @var yii\web\View $this */

$this->title = 'La Cuchara - Inicio';
?>
<div class="site-index">

    <div class="body-content">
        <!-- Barra de búsqueda -->
        <?= \app\widgets\BarraBusqueda::widget() ?>

        <!-- Carruseles -->
        <?= \app\widgets\FichaRestaurante::widget(['id' => 1]) ?>

        <!-- Registra tu restaurante -->

    </div>
</div>
