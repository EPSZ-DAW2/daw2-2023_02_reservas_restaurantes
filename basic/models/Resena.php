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
 * @property string $ref_cliente Referencia del cliente asociado a la resena.
 * @property int $id_restaurante Identificador del restaurante asociado a la resena.
 * @property string|null $notas Notas internas para la resena.
 *
 * @property ImagenesResenas[] $imagenesResenas
 * @property Clientes $refCliente
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
            [['puntuacion', 'fecha_resena', 'ref_cliente', 'id_restaurante'], 'required'],
            [['puntuacion', 'incidencia_resena', 'id_restaurante'], 'integer'],
            [['precio_x_persona'], 'number'],
            [['fecha_resena'], 'safe'],
            [['notas'], 'string'],
            [['titulo_resena'], 'string', 'max' => 100],
            [['cuerpo_resena'], 'string', 'max' => 500],
            [['ref_cliente'], 'string', 'max' => 10],
            [['ref_cliente'], 'exist', 'skipOnError' => true, 'targetClass' => Clientes::class, 'targetAttribute' => ['ref_cliente' => 'ref_cliente']],
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
            'ref_cliente' => 'Ref Cliente',
            'id_restaurante' => 'Id Restaurante',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[ImagenesResenas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagenesResenas()
    {
        return $this->hasMany(ImagenesResenas::class, ['id_resena' => 'id_resena']);
    }

    /**
     * Gets query for [[RefCliente]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRefCliente()
    {
        return $this->hasOne(Clientes::class, ['ref_cliente' => 'ref_cliente']);
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
