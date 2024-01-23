<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var app\models\RegistroForm $model */

use app\models\BusquedaFiltrada;
use app\widgets\FichaRestaurante;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\widgets\LinkPager;



$this->title = 'Encuentra Tu Restaurante';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class= "container">
    <div class="site-login">
        <div class="row">
            <div class="d-flex justify-content-center">
                <div class="col-lg-10">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h1><?= Html::encode($this->title) ?></h1>
                        </div>
                    </div>

                    <div class="row mt-5">
                        <div class="col-lg-12 text-center">
                            <button class="btn btn-primary col-lg-4" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMenu" aria-expanded="false" aria-controls="collapseMenu">
                                Filtre la Búsqueda
                            </button>
                        </div>
                    </div>

                    <div class="collapse" id="collapseMenu">

                        <?php $form = ActiveForm::begin([
                            'id' => 'busqueda-filtrada-form',
                            'fieldConfig' => [
                                'template' => "{label}\n{input}\n{error}",
                                'labelOptions' => ['class' => 'col-lg-12 col-sm-12 col-form-label mr-lg-3'],
                                'inputOptions' => ['class' => 'col-lg-3 col-sm-12 form-control'],
                                'errorOptions' => ['class' => 'col-lg-7 col-sm-12 invalid-feedback'],
                            ],
                        ]);  ?>
                        <div class="row">
                            <div class="col-lg-6">
                            
                            <?= $form->field($model, 'categoria')
                                ->label('Categoría Restaurante')
                                ->dropDownList($categoriasDropdown, ['prompt' => 'Seleccionar Categoría del Restaurante']) ?>
                            
                            </div>
                            <div class="col-lg-6">

                            <?= $form->field($model, 'tipoComida')
                                ->label('Tipo Restaurante')
                                ->dropDownList($tiposDropdown, ['prompt' => 'Seleccionar Tipo del Restaurante']) ?>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4">
                                <?= $form->field($model, 'precioDesde')
                                    ->label('Precio Desde (€)')
                                    ->textInput(['type' => 'number', 'step' => '0.50']) ?>
                            </div>

                            <div class="col-lg-4">
                                <?= $form->field($model, 'precioHasta')
                                    ->label('Precio Hasta (€)')
                                    ->textInput(['type' => 'number', 'step' => '0.50']) ?>
                            </div>

                            <div class="col-lg-4">
                                <?= $form->field($model, 'puntuacion')
                                    ->label('Puntuación')
                                    ->dropDownList(
                                        [0 => '(0-1) 🥄' , 1 => '(1-2) 🥄', 2 => '(2-3) 🥄', 3 => '(3-4) 🥄', 4 => '(4-5) 🥄', 5 => '5 🥄' ],['prompt' => 'Seleccionar Puntuación']) ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <?php
                                $comunidadesDropdown = array_combine($comunidades, $comunidades);
                                $comunidadesDropdown = ['' => 'Seleccionar Comunidad Autónoma'] + $comunidadesDropdown;
                                ?>
                                <?= $form->field($model, 'ubicacionCA')
                                    ->label('Comunidad Autónoma')
                                    ->dropDownList($comunidadesDropdown) ?>
                            </div>

                            <div class="col-lg-4">
                                <?php
                                $ciudadesDropdown = array_combine($ciudades, $ciudades);
                                $ciudadesDropdown = ['' => 'Seleccionar Ciudad'] + $ciudadesDropdown;
                                ?>
                                <?= $form->field($model, 'ubicacionCiudad')
                                    ->label('Ciudad')
                                    ->dropDownList($ciudadesDropdown) ?>
                            </div>

                            <div class="col-lg-4">
                                <?php
                                $barriosDropdown = array_combine($barrios, $barrios);
                                $barriosDropdown = ['' => 'Seleccionar Barrio'] + $barriosDropdown;
                                ?>
                                <?= $form->field($model, 'ubicacionBarrio')
                                    ->label('Barrio')
                                    ->dropDownList($barriosDropdown) ?>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <?= $form->field($model, 'diaSemana')->label('Día de la Semana')->dropDownList(
                                    [
                                        'lunes' => 'Lunes',
                                        'martes' => 'Martes',
                                        'miércoles' => 'Miércoles',
                                        'jueves' => 'Jueves',
                                        'viernes' => 'Viernes',
                                        'sábado' => 'Sábado',
                                        'domingo' => 'Domingo',
                                    ],
                                    ['prompt' => 'Seleccionar Día']
                                ) ?>
                            </div>

                            <div class="col-lg-6">
                                <?= $form->field($model, 'horaDia')->label('Hora del Día')->dropDownList(
                                    [
                                        'abierto' => 'Abierto Ahora',
                                        '8:00:00' => '8:00',
                                        '9:00:00' => '9:00',
                                        '10:00:00' => '10:00',
                                        '11:00:00' => '11:00',
                                        '12:00:00' => '12:00',
                                        '13:00:00' => '13:00',
                                        '14:00:00' => '14:00',
                                        '15:00:00' => '15:00',
                                        '16:00:00' => '16:00',
                                        '17:00:00' => '17:00',
                                        '18:00:00' => '18:00',
                                        '19:00:00' => '19:00',
                                        '20:00:00' => '20:00',
                                        '21:00:00' => '21:00',
                                        '22:00:00' => '22:00',
                                        '23:00:00' => '23:00',
                                        '0:00:00' => '0:00',
                                    ],
                                    ['prompt' => 'Seleccionar Hora']
                                ) ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-8">
                                    <?= Html::submitButton('Aplicar Filtros', ['class' => 'btn btn-success form-control mt-md-1 mt-sm-1 mt-xs-1 mt-1', 'name' => 'busqueda-filtrada-button']) ?>
                                </div>
                                <div class="col-lg-4">
                                    <?= Html::resetButton('Limpiar Filtros', ['class' => 'btn btn-secondary form-control mt-md-1 mt-sm-1 mt-xs-1 mt-1', 'name' => 'limpiar-filtros-button']) ?>
                                </div>
                            </div>
                        </div>
                        <?php ActiveForm::end(); ?>
                    </div>                      
                </div>
            </div>
        </div>
    </div>
    <!-- mostramos los restaurantes -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 my-5">
        <?php if(isset($dataProvider)) { ?>
            <?php foreach ($dataProvider->getModels() as $model): ?>
                <div class="col">
                    <?= FichaRestaurante::widget(['id' => $model->id_restaurante]); ?>
                </div>
            <?php endforeach; ?>
    </div>
    <div class="d-flex justify-content-center">
        <?= LinkPager::widget([
            'pagination' => $dataProvider->pagination,
            'options' => ['class' => 'pagination'],
            'prevPageLabel' => '<',
            'nextPageLabel' => '>',
            'prevPageCssClass' => 'page-item',
            'nextPageCssClass' => 'page-item',
            'linkOptions' => ['class' => 'page-link'],
            'disabledListItemSubTagOptions' => ['tag' => 'a', 'class' => 'page-link'],
        ]); ?>
        <?php } ?>    
    </div>
</div>