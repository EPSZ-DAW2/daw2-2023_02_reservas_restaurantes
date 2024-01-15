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
  public $nombreCategoria;
  private $ids = [];

  public function init()
  {
    parent::init();
    
    //obtiene una instancia de la categoria por el nombre
    $categoria = Categoria::find()->where(['nombre_categoria' => $this->nombreCategoria])->one();
    if($categoria != NULL)
    {
      //obtiene todas las relaciones con esa categoria
      $restaurantesCategoria = CategoriaRestaurante::find()->where(['id_categoria' => $categoria->id_categoria])->all();
    }

    //Guarda el id de los restaurantes en esa categoría para enviarlo a la vista
    if(isset($restaurantesCategoria))
    {
      foreach ($restaurantesCategoria as $relacion)
      {
          $this->ids[] = strval($relacion->id_restaurante);
      }
    }
  }

  public function run()
  {
    return $this->render('carruselRestaurante', ['ids' => $this->ids, 'fichasPorBloque' => 4, 'nombreCategoria'=>$this->nombreCategoria]);
  }
}