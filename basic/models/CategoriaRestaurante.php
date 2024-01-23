<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categoria_restaurante".
 *
 * @property int $id_categoria Identificador de la categoria.
 * @property int $id_restaurante Identificador del restaurante.
 * @property string|null $notas Notas internas para la relacion.
 *
 * @property Categoria $categoria
 * @property Restaurante $restaurante
 */
class CategoriaRestaurante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categoria_restaurante';
    }

    //Es necesario sobreescribir primaryKey() porque la relación no tiene clave primaria
    /**
     * @inheritdoc
     */
    public static function primaryKey()
    {
        return ['id_categoria', 'id_restaurante'];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_categoria', 'id_restaurante'], 'required'],
            [['id_categoria', 'id_restaurante'], 'integer'],
            [['notas'], 'string'],
            [['id_categoria'], 'exist', 'skipOnError' => true, 'targetClass' => Categoria::class, 'targetAttribute' => ['id_categoria' => 'id_categoria']],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurante::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_categoria' => 'Id Categoria',
            'id_restaurante' => 'Id Restaurante',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[Categoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoria()
    {
        return $this->hasOne(Categoria::class, ['id_categoria' => 'id_categoria']);
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
