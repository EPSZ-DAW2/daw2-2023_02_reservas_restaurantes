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

    /**
     * Gets query for [[Padre]].
     *
     * @return \yii\db\ActiveQuery
     * 
     * Relación de esta categoría con la del padre
     */
    public function getPadre()
    {
        return $this->hasOne(Categoria::class, ['id_categoria' => 'id_categoria_padre']);
    }

    /**
     * Gets query for [[Padre]].
     *
     * @return \yii\db\ActiveQuery
     * 
     * Devuelve el número de restaurantes relacionados con la categoria
     */
    public function getNumRestaurantes()
    {
        return $this->hasMany(CategoriaRestaurante::class, ['id_categoria' => 'id_categoria'])->count();
    }

    /**
     * {@inheritdoc}
     * @return CategoriaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoriaQuery(get_called_class());
    }

    /*
    * Devuelve las categorias que son hijo de esta
    */
    public function getHijos()
    {
        return Categoria::find()->where(['id_categoria_padre' => $this->id_categoria])->all();
    }

    public function getDescendientes($categorias)
    {
        $hijos = $this->hijos;
        
        foreach ($hijos as $hijo) {
            $categorias[] = $hijo;
            $categorias = $hijo->getDescendientes($categorias);
        }

        return $categorias;
    }


    /**
     * Obtiene los nombres de todas las categorías y sus subcategorías en la base de datos.
     * @return array Lista de categorías y sus subcategorías
     */
    public static function obtenerCategoriasConPadre()
    {
        $categorias = Categoria::find()->all();
        $categoriasConPadre = [];

        foreach ($categorias as $categoria) {
            $categoriaConPadre = [
                'cat' => $categoria->nombre_categoria,
                'padre' => self::obtenerNombresCategoriasPadre($categoria),
            ];

            $categoriasConPadre[] = $categoriaConPadre;
        }

        return $categoriasConPadre;
    }


    /**
     * Obtiene los nombres de las subcategorías de una categoría dada.
     * @param Categoria $categoria Categoría para la cual obtener las subcategorías
     * @return array Lista de nombres de subcategorías
     */
    private static function obtenerNombresCategoriasPadre($categoria)
    {
        $padre = $categoria->getPadre()->select('nombre_categoria')->scalar();
        return $padre;
    }

}
