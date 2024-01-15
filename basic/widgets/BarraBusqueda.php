<?php
//widget sencillo para mostrar la barra de búsqueda

namespace app\widgets;

use yii\base\Widget;
use yii\helpers\Html;

class BarraBusqueda extends Widget
{
    public function run()
    {
        return $this->render('barraBusqueda');
    }
}
