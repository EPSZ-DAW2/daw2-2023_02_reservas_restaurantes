<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\RespuestasFaq $model */

use \app\models\Comentario;
use yii\grid\GridView;
use yii\data\ActiveDataProvider;
use app\models\Configuracion;

$this->title = 'Crear Pregunta Frecuente';
$this->params['breadcrumbs'][] = ['label' => 'Preguntas Frecuentes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="respuestas-faq-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

    <hr>

    <div class="mt-2">
        <h2>Lista de Comentarios disponibles</h2>
        <?php

        $dataProvider = new ActiveDataProvider([
            'query' => Comentario::find(),
        ]);
        $dataProvider->pagination->pageSize = Configuracion::findByNombreVariable('numElemsFAQ') ? Configuracion::findByNombreVariable('numElemsFAQ') : 10;

        echo GridView::widget([
            'dataProvider' => $dataProvider,
            'columns' => [
                ['attribute' => 'id_comentario', 'label' => 'ID'],
                ['attribute' => 'id_usuario', 'label' => 'ID Usuario'],
                ['attribute' => 'comentario', 'label' => 'Contenido'],
                ['attribute' => 'notas', 'label' => 'Notas'],
            ],
            'pager' => [
                'options' => ['class' => 'pagination justify-content-center'],
                'prevPageLabel' => '<',
                'nextPageLabel' => '>',
                'prevPageCssClass' => 'page-item',
                'nextPageCssClass' => 'page-item',
                'linkOptions' => ['class' => 'page-link'],
                'disabledListItemSubTagOptions' => ['tag' => 'a', 'class' => 'page-link'],
            ],
        ]);
        ?>
    </div>

</div>
