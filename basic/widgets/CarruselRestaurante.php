<?php
namespace app\widgets;

use yii\base\Widget;
use \app\models\Restaurante;
use \app\models\Categoria;
use app\models\CategoriaRestaurante;
use Yii;

/*
  Versión de carrusel de restaurantes que utiliza el carousel de bootstrap5,
  pendiente implementar una versión dinámica con JS
*/
class CarruselRestaurante extends Widget
{
  public $idCategoria;
  private $nombreCategoria;
  private $models = [];

  public function init()
  {
    parent::init();
    
    //obtiene una instancia de la categoria por el nombre
    $categoria = Categoria::find()->where(['id_categoria' => $this->idCategoria])->one();
    $this->nombreCategoria = $categoria->nombre_categoria;
    if($categoria != NULL)
    {
      //obtiene todas las relaciones con esa categoria
      $restaurantesCategoria = CategoriaRestaurante::find()->where(['id_categoria' => $this->idCategoria])->all();
    }

    //Guarda el id de los restaurantes en esa categoría para enviarlo a la vista
    if(isset($restaurantesCategoria))
    {
      foreach ($restaurantesCategoria as $relacion)
      {
          $this->models[] = Restaurante::findOne($relacion->id_restaurante);
      }
    }
  }

  public function run()
  {
    return $this->render('carruselRestaurante', [
      'nombreCategoria'=>$this->nombreCategoria, 'idCategoria' => $this->idCategoria, 'models' => $this->models
    ]);
  }
}
