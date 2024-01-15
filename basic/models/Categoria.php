<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categorias".
 *
 * @property int $id_categoria Identificador de cada categoria de restaurante.
 * @property int|null $id_categoria_padre Identificador de la categoría padre NULL si no tiene
 * @property string $nombre_categoria Nombre de la categoria.
 * @property string|null $notas Notas internas para la categoria.
 *
 * @property CategoriaRestaurante[] $categoriaRestaurantes
 */
class Categoria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categorias';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_categoria_padre'], 'integer'],
            [['nombre_categoria'], 'required'],
            [['notas'], 'string'],
            [['nombre_categoria'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_categoria' => 'Id Categoria',
            'id_categoria_padre' => 'Id Categoria Padre',
            'nombre_categoria' => 'Nombre Categoria',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[CategoriaRestaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoriaRestaurantes()
    {
        return $this->hasMany(CategoriaRestaurante::class, ['id_categoria' => 'id_categoria']);
    }
}
