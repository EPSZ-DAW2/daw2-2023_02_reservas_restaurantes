<?php

/** @var yii\web\View $this */
use \app\widgets\CarruselRestaurante;
use \app\widgets\BarraBusqueda;
use yii\helpers\Html;
use yii\helpers\Url;

use \app\models\Imagen;

$this->title = 'La Cuchara - Inicio';
?>
<div class="site-index">

    <div class="body-content">
        <!-- Barra de búsqueda -->
        <?= BarraBusqueda::widget() ?>

        <!-- Carruseles -->
      
        <?php 
            for($i=1; $i<=$maxCategoria && $i<=$numCategorias; $i++){
                echo CarruselRestaurante::widget([
                    'idCategoria' => $i,
                ]);
            }
        if($numCategorias < $maxCategoria){
            echo '<div class="text-center">';
            echo Html::a('Mostrar más categorías', ['index', 'numCategorias' => $numCategorias + 2], ['class' => 'btn btn-outline-primary']);
            echo '</div>';
        }    
        ?>

        <hr>
        <!-- Registra tu restaurante -->
        <div style="<?php if($imagenPropietario){ echo "background-image: url('$imagenPropietario->urlImagen'); background-size: cover; "; }?>height: 250px;">
            <div class="text-center" style="background-color: rgba(0, 0, 0, 0.5); padding: 20px; height: 100%;">
                <h1 class="text-white">¿Quieres registrar tu restaurante?</h1>
                <?= Html::a('Registrate como propietario', ['/site/registro', 'registrogp'=>1], ['class' => 'btn btn-primary']) ?>
            </div>
        </div>

    </div>
</div>
