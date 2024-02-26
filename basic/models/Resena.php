<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "resenas".
 *
 * @property int $id_resena Identificador de cada resena.
 * @property string|null $titulo_resena Título de la resena.
 * @property string|null $cuerpo_resena Cuerpo de la resena.
 * @property int $puntuacion Puntuación de 0-5.
 * @property float|null $precio_x_persona Precio por persona gastado.
 * @property int|null $incidencia_resena Marca de incidencia en una resena: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.
 * @property string $fecha_resena Fecha de la resena.
 * @property int $id_cliente Referencia del cliente asociado a la resena.
 * @property int $id_restaurante Identificador del restaurante asociado a la resena.
 * @property string|null $notas Notas internas para la resena.
 *
 * @property Cliente $cliente
 * @property ImagenesResena[] $imagenesResenas
 * @property Respuestas[] $respuestas
 * @property Restaurante $restaurante
 */
class Resena extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'resenas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['puntuacion', 'fecha_resena', 'id_usuario', 'id_restaurante'], 'required'],
            [['puntuacion', 'incidencia_resena', 'id_usuario', 'id_restaurante'], 'integer'],
            [['precio_x_persona'], 'number'],
            [['fecha_resena'], 'safe'],
            [['notas'], 'string'],
            [['titulo_resena'], 'string', 'max' => 100],
            [['cuerpo_resena'], 'string', 'max' => 500],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::class, 'targetAttribute' => ['id_usuario' => 'id_usuario']],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurante::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_resena' => 'Id Resena',
            'titulo_resena' => 'Titulo Resena',
            'cuerpo_resena' => 'Cuerpo Resena',
            'puntuacion' => 'Puntuacion',
            'precio_x_persona' => 'Precio X Persona',
            'incidencia_resena' => 'Incidencia Resena',
            'fecha_resena' => 'Fecha Resena',
            'id_usuario' => 'Id Cliente',
            'id_restaurante' => 'Id Restaurante',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[Cliente]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Usuario::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[ImagenesResenas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagenesResenas()
    {
        return $this->hasMany(ImagenesResena::class, ['id_resena' => 'id_resena']);
    }

    /**
     * Gets query for [[Respuestas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRespuestas()
    {
        return $this->hasMany(Respuestas::class, ['id_resena' => 'id_resena']);
    }

    /**
     * Gets query for [[Restaurante]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRestaurante()
    {
        return $this->hasOne(Restaurante::class, ['id_restaurante' => 'id_restaurante']);
    }
}
