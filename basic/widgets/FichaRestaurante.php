<?php

namespace app\widgets;

use yii\base\Widget;
use app\models\Restaurante;

class FichaRestaurante extends Widget
{

  public $id; //id para buscar el restaurante, se pasa como parámetro del widget

  private $model; //instancia de restaurante obtenida

  public function init()
  {
    parent::init();

    $this->model = Restaurante::findOne($this->id);
    if ($this->model === null) {
      throw new \yii\web\NotFoundHttpException('El restaurante con el id propocionado no existe.');
    }
  }

  public function run()
  {
    return $this->render('fichaRestaurante', ['model' => $this->model]);
  }

}
