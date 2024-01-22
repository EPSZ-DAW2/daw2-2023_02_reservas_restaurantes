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

  public function agregarHijos($restaurantesCategoria)
  {
    //si la categoria tiene hijos, obtiene los restaurantes de las categorias hijos
    $hijos = Categoria::find()->where(['id_categoria_padre' => $this->idCategoria])->all();
    //Si la categoria tiene hijos, se agregan los restaurantes de las categorias hijo recursivamente
    if ($hijos != NULL) {
      foreach ($hijos as $hijo) {
        //agregamos los restaurantes de cada hijo a la lista de restaurantes
        $restaurantesCategoria[] = CategoriaRestaurante::find()->where(['id_categoria' => $hijo->id_categoria])->all();
      }
    }
  }

  public function init()
  {
    parent::init();

    //obtiene una instancia de la categoria por el nombre
    $categoria = Categoria::find()->where(['id_categoria' => $this->idCategoria])->one();
    $this->nombreCategoria = $categoria->nombre_categoria;
    $descendientes = [];
    $descendientes = $categoria->getDescendientes($descendientes);

    //se agrega la categoria padre y sus descendientes a un array
    $categorias = [];
    $categorias[] = $categoria;
    foreach ($descendientes as $descendiente) 
    {
      $categorias[] = $descendiente;
    }

    foreach($categorias as $categoria)
    {
      //se obtiene la relacion
      $restaurantesCategoria = CategoriaRestaurante::find()->where(['id_categoria' => $categoria->id_categoria])->all();
      if ($restaurantesCategoria != NULL)
      {
        foreach ($restaurantesCategoria as $relacion) 
        {
          $restaurante = Restaurante::findOne($relacion->id_restaurante);
          //si el restaurante no está en la lista de restaurantes, se agrega
          if (!in_array($restaurante, $this->models)) 
          {
            $this->models[] = $restaurante;
          }
        }
      }
    }

  }

  public function run()
  {
    return $this->render('carruselRestaurante', [
      'nombreCategoria' => $this->nombreCategoria, 'idCategoria' => $this->idCategoria, 'models' => $this->models
    ]);
  }
}

