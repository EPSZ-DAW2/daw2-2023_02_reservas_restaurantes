<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "imagenes_restaurantes".
 *
 * @property int $id_restaurante Identificador de cada imagen aportada por el restaurante.
 * @property int $id_imagen Identificador la imagen.
 * @property string|null $notas Notas internas para la relación imagen del restaurante.
 *
 * @property Imagen $imagen
 * @property Restaurante $restaurante
 */
class ImagenesRestaurante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'imagenes_restaurantes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_restaurante', 'id_imagen'], 'required'],
            [['id_restaurante', 'id_imagen'], 'integer'],
            [['notas'], 'string'],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurante::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
            [['id_imagen'], 'exist', 'skipOnError' => true, 'targetClass' => Imagen::class, 'targetAttribute' => ['id_imagen' => 'id_imagen']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_restaurante' => 'Id Restaurante',
            'id_imagen' => 'Id Imagen',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[Imagen]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagen()
    {
        return $this->hasOne(Imagen::class, ['id_imagen' => 'id_imagen']);
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
