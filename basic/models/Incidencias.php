<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "incidencias".
 *
 * @property int $id_incidencia Identificador de cada incidencia.
 * @property string $tipo Tipo de incidencia.
 * @property string|null $descripcion Descripción de la incidencia.
 * @property int|null $id_usuario Identificador del usuario que reporta la incidencia.
 * @property int|null $id_restaurante Identificador del restaurante asociado a la incidencia.
 * @property string $fecha_creacion Fecha de creación de la incidencia.
 * @property string $fecha_actualizacion Fecha de actualización de la incidencia.
 *
 * @property Restaurantes $restaurante
 * @property Usuarios $usuario
 */
class Incidencias extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'incidencias';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tipo'], 'required'],
            [['tipo', 'descripcion'], 'string'],
            [['id_usuario', 'id_restaurante'], 'integer'],
            [['fecha_creacion', 'fecha_actualizacion'], 'safe'],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuarios::class, 'targetAttribute' => ['id_usuario' => 'id_usuario']],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurantes::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_incidencia' => 'Id Incidencia',
            'tipo' => 'Tipo',
            'descripcion' => 'Descripcion',
            'id_usuario' => 'Id Usuario',
            'id_restaurante' => 'Id Restaurante',
            'fecha_creacion' => 'Fecha Creacion',
            'fecha_actualizacion' => 'Fecha Actualizacion',
        ];
    }

    /**
     * Gets query for [[Restaurante]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRestaurante()
    {
        return $this->hasOne(Restaurantes::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[Usuario]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuarios::class, ['id_usuario' => 'id_usuario']);
    }
}
