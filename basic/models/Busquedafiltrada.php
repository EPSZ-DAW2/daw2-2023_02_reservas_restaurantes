<?php

namespace app\models;

use Yii;
use yii\base\Model;


class BusquedaFiltrada extends Model
{
    
    public $tipoComida;
    public $categoria;
    public $precioDesde;
    public $precioHasta;
    public $puntuacion;
    public $ubicacionCA;
    public $ubicacionCiudad;
    public $ubicacionBarrio;
    public $horaDia;
    public $diaSemana;


    public function rules()
    {
        return [
            [['precioDesde', 'precioHasta'], 'compare', 'compareValue' => 0, 'operator' => '>=', 'message' => 'El precio debe ser mayor o igual a cero.'],            
            [['precioDesde', 'precioHasta'], 'number', 'numberPattern' => '/^\d+(\.\d{1,2})?$/', 'message' => 'El precio desde debe tener máximo 2 decimales.'],
            ['precioHasta', 'compare', 'compareAttribute' => 'precioDesde', 'operator' => '>', 'type' => 'number', 'message' => 'El precio hasta debe ser mayor que el precio desde.'],
            [['tipoComida', 'categoria', 'puntuacion', 'ubicacionCA', 'ubicacionCiudad', 'ubicacionBarrio', 'horaDia', 'diaSemana', 'palabrasClave'], 'safe'],
            ['horaDia', 'validateHoraDia'],
        ];
    }


    public function validateHoraDia($attribute, $params)
    {
        // Obtén el valor seleccionado para 'diaSemana' y 'horaDia'
        $diaSemana = $this->diaSemana;
        $horaDia = $this->horaDia;

        // Si se selecciona un día de la semana y la hora es 'abiertoAhora', muestra un error
        if ($diaSemana !== null && $horaDia === 'abierto') {
            $this->addError($attribute, 'No puedes seleccionar "Ahora mismo" si has elegido un día de la semana.');
        }
    }


    public function busquedaFiltrada()
    {
        //comprobamos si los datos del filtro cumplen las reglas
        if ($this->validate()) {

            // si tenemos puntuacion
            if($this->puntuacion != null)
            {
                //obtnemos el rango de puntuacion
                $rango = $this->crearRangosPuntuacion();
                // Obtener los IDs de restaurantes en el rango de puntuación
                $restaurantesEnRango = $this->getRestaurantesEnRangoDePuntuacion($rango['min'], $rango['max']); 
            }

            // Construir la consulta basada en los filtros
            $query = Restaurante::find();

            //si tenemos categoria
            if ($this->categoria) {
                $nombreCategoria = $this->categoria;
                $categoria = Categoria::findOne(['nombre_categoria' => $nombreCategoria]);
                $categoriaId = $categoria->id_categoria;

                $query->leftJoin('categoria_restaurante', 'restaurantes.id_restaurante = categoria_restaurante.id_restaurante');
                $query->leftJoin('categorias', 'categoria_restaurante.id_categoria = categorias.id_categoria');
                $query->where(['or', ['categorias.id_categoria' => $categoriaId], ['categorias.id_categoria_padre' => $categoriaId]]);
                $query->groupBy(['restaurantes.id_restaurante']);

            }

            //si tenemos tipo
            if ($this->tipoComida) {
                $nombreTipo = $this->tipoComida;
                $tipoComida = TipoComida::findOne(['nombre_tipo' => $nombreTipo]);
                $TipoId = $tipoComida->id_tipo_comida;

                $query->leftJoin('tipo_restaurante', 'restaurantes.id_restaurante = tipo_restaurante.id_restaurante');
                $query->leftJoin('tipos_comida', 'tipo_restaurante.id_tipo_comida = tipos_comida.id_tipo_comida');
                $query->where(['or', ['tipos_comida.id_tipo_comida' => $TipoId], ['tipos_comida.id_tipo_padre' => $TipoId]]);
                $query->groupBy(['restaurantes.id_restaurante']);

            }
            $query->andFilterWhere(['>=', 'restaurantes.precio_medio_comensal', $this->precioDesde]);
            $query->andFilterWhere(['<=', 'restaurantes.precio_medio_comensal', $this->precioHasta]);
            $query->andFilterWhere(['restaurantes.comunidad_autonoma_restaurante' => $this->ubicacionCA]);
            $query->andFilterWhere(['restaurantes.ciudad_restaurante' => $this->ubicacionCiudad]);
            $query->andFilterWhere(['restaurantes.barrio_restaurante' => $this->ubicacionBarrio]);
            if($this->puntuacion != null)
                $query->andFilterWhere(['restaurantes.id_restaurante' => $restaurantesEnRango]);

            //si tenemos dia de la semana o hora
            if($this->diaSemana || $this->horaDia)
                $query->leftJoin('horario', 'restaurantes.id_restaurante = horario.id_restaurante');

            $query->andFilterWhere(['horario.dia' => $this->diaSemana]);

            if($this->horaDia == 'abierto')
            {
                $query->andFilterWhere(['<=', 'horario.hora_apertura', date('H:i:s')]);
                $query->andFilterWhere(['>=', 'horario.hora_cierre', date('H:i:s')]);   
            }
            else
            {
                $query->andFilterWhere(['<=', 'horario.hora_apertura', $this->horaDia]);
                $query->andFilterWhere(['>=', 'horario.hora_cierre', $this->horaDia]);
            }
            

          
            $restaurantesIds = $query->select(['restaurantes.id_restaurante'])->column();

            // Devolver la lista de IDs
            return $restaurantesIds;

        }

        //si no son correctos o algo falla
        return false;
    }


    public function busquedaBarra($palabrasClave)
    {
        $query = Restaurante::find();

        $query->orWhere(['like', 'nombre_restaurante', $palabrasClave]);
        $query->orWhere(['like', 'comunidad_autonoma_restaurante', $palabrasClave]);
        $query->orWhere(['like', 'ciudad_restaurante', $palabrasClave]);
        $query->orWhere(['like', 'barrio_restaurante', $palabrasClave]);

        $restaurantesIds = $query->select(['restaurantes.id_restaurante'])->column();

        // Devolver la lista de IDs
        return $restaurantesIds;
    }


    public function getRestaurantesEnRangoDePuntuacion($puntuacionMinima, $puntuacionMaxima)
    {
        $restaurantesEnRango = [];

        // Obtener todos los restaurantes
        $restaurantes = Restaurante::find()->all();

        foreach ($restaurantes as $restaurante) {
            // Calcular la puntuación promedio para cada restaurante
            $puntuacionPromedio = $restaurante->getPuntuacionPromedio();

            // Verificar si la puntuación está en el rango especificado
            if ($puntuacionPromedio >= $puntuacionMinima && $puntuacionPromedio <= $puntuacionMaxima) {
                // Agregar el ID del restaurante al array
                $restaurantesEnRango[] = $restaurante->id_restaurante;
            }
        }

        return $restaurantesEnRango;
    }


    public function crearRangosPuntuacion()
    {
        for($i=0;$i<=5;$i++)
        {
            if($this->puntuacion == $i)
            {
                $rango = ['min' => $i, 'max' => $i+0.99];
                return $rango;
            }
        }
    }


}