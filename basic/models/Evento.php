<?php

// Archivo: models/Evento.php
namespace app\models;

use yii\db\ActiveRecord;

class Evento extends ActiveRecord
{
    // Atributos del modelo
    public $titulo_evento;
    public $fecha_evento;
    public $descripcion_evento;
    public $id_imagen_promocional;
    public $incidencia_evento;
    public $id_restaurante;
    public $notas;

    // Reglas de validación
     public function rules()
    {
        return [
            [['titulo_evento', 'descripcion_evento', 'fecha_evento', 'id_imagen_promocional', 'id_restaurante'], 'required'],
            [['fecha_evento'], 'date', 'format' => 'php:Y-m-d'],
            [['incidencia_evento'], 'integer'],
            [['notas'], 'string'],
        ];
    }

    // Etiquetas para los atributos
    public function attributeLabels()
    {
        return [
            'titulo_evento' => 'Título del Evento',
            'fecha_evento' => 'Fecha del Evento',
            'descripcion_evento' => 'Descripción del Evento',
            'id_imagen_promocional' => 'ID de la Imagen Promocional',
            'incidencia_evento' => 'Incidencia del Evento',
            'id_restaurante' => 'ID del Restaurante',
            'notas' => 'Notas',
        ];
    }

    // Nombre de la tabla asociada al modelo
    public static function tableName()
    {
        return 'eventos';
    }
}
