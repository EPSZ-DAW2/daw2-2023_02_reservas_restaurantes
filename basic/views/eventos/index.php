

<!-- Archivo: views/eventos/index.php -->
<?php
use yii\helpers\Html;
use yii\grid\GridView;

$this->title = 'Lista de Eventos';
$this->params['breadcrumbs'][] = $this->title;
?>

<h1><?= Html::encode($this->title) ?></h1>

<p>
    <?= Html::a('Crear Nuevo Evento', ['create'], ['class' => 'btn btn-success']) ?>
</p>

<?= GridView::widget([
    'dataProvider' => $dataProvider, // Asegúrate de que `$dataProvider` esté disponible en tu controlador.
    'columns' => [
        'id_evento',
        'titulo_evento',
        'fecha_evento',
        'descripcion_evento',
        // Agrega más columnas según tu estructura de base de datos

        ['class' => 'yii\grid\ActionColumn'],
    ],
]); ?>
