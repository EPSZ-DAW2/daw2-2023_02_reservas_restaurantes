<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "imagenes".
 *
 * @property int $id_imagen Identificador de imagen.
 * @property string|null $descripcion Texto que describe la imagen y se muestra como pié de foto (opcional).
 * @property string|null $notas Notas internas para la imagen.
 *
 * @property Evento[] $eventos
 * @property ImagenesResena[] $imagenesResenas
 * @property ImagenesRestaurante[] $imagenesRestaurantes
 * @property Restaurante[] $restaurantes
 * @property Restaurante[] $restaurantes0
 * @property Usuario[] $usuarios
 */
class Imagen extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'imagenes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['notas'], 'string'],
            [['descripcion'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_imagen' => 'Id Imagen',
            'descripcion' => 'Descripcion',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[Eventos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEventos()
    {
        return $this->hasMany(Evento::class, ['id_imagen_promocional' => 'id_imagen']);
    }

    /**
     * Gets query for [[ImagenesResenas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagenesResenas()
    {
        return $this->hasMany(ImagenesResena::class, ['id_imagen' => 'id_imagen']);
    }

    /**
     * Gets query for [[ImagenesRestaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagenesRestaurantes()
    {
        return $this->hasMany(ImagenesRestaurante::class, ['id_imagen' => 'id_imagen']);
    }

    /**
     * Gets query for [[Restaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRestaurantes()
    {
        return $this->hasMany(Restaurante::class, ['id_foto_restaurante' => 'id_imagen']);
    }

    /**
     * Gets query for [[Restaurantes0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRestaurantes0()
    {
        return $this->hasMany(Restaurante::class, ['id_carta' => 'id_imagen']);
    }

    /**
     * Gets query for [[Usuarios]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarios()
    {
        return $this->hasMany(Usuario::class, ['id_foto_usuario' => 'id_imagen']);
    }
}
