<?php

use app\models\RespuestasFaq;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\RespuestasFaqSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Preguntas Frecuentes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="respuestas-faq-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="chat-container">
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'layout' => "{items}", // Solo muestra los items, sin encabezados
            'tableOptions' => ['class' => 'table table-striped'], // Puedes agregar clases de estilo de Bootstrap si las estás utilizando
            'columns' => [
                // Eliminada la columna de índice numérico
                [
                    'attribute' => 'pregunta',
                    'format' => 'html',
                    'value' => function ($model) {
                        return '<div class="chat-message question">' . Html::encode($model->pregunta) . '</div>';
                    },
                ],
                [
                    'attribute' => 'respuesta',
                    'format' => 'html',
                    'value' => function ($model) {
                        return '<div class="chat-message answer">' . Html::encode($model->respuesta) . '</div>';
                    },
                ],
            ],
        ]); ?>
    </div>
</div>

<style>
    .chat-container {
        display: flex;
        flex-direction: column;
        max-width: 800px; /* Ajusta el ancho máximo según tus preferencias */
        margin: auto;
    }

    .chat-message {
        padding: 10px;
        margin: 5px;
        border-radius: 5px;
        max-width: 80%;
        word-wrap: break-word;
    }

    .question {
        background-color: #f1f1f1;
    }

    .answer {
        background-color: #dff6e8;
    }
</style>
