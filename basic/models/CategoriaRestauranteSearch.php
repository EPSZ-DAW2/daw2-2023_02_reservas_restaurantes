<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Categoria;

/**
 * CategoriaSearch represents the model behind the search form of `app\models\Categoria`.
 */
class CategoriaRestauranteSearch extends Categoria
{

    public $nombre_categoria_padre;
    public $num_restaurantes;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_categoria', 'id_categoria_padre', 'num_restaurantes'], 'integer'],
            [['nombre_categoria', 'notas', 'nombre_categoria_padre'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Categoria::find();
        $query->joinWith(['padre as padre']); //une la categoría con su categoría padre 'padre'

        // Se agrega la cuenta de los restaurantes pertenecientes a la categoria
        $query->select([
            'categorias.*', 'num_restaurantes' => CategoriaRestaurante::find()
                ->select(['COUNT(*)'])
                ->where('categoria_restaurante.id_categoria = categorias.id_categoria')
        ]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            //es necesario agregar manualmente la propiedad sort para incluir nombre_categoria_padre, ya que no es un atributo del modelo
            'sort' => [
                'attributes' => [
                    'id_categoria',
                    'nombre_categoria',
                    'id_categoria_padre',
                    'nombre_categoria_padre' => [
                        'asc' => ['padre.nombre_categoria' => SORT_ASC],
                        'desc' => ['padre.nombre_categoria' => SORT_DESC],
                    ],
                    'num_restaurantes',
                    'notas',
                ]
            ]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_categoria' => $this->id_categoria,
            'id_categoria_padre' => $this->id_categoria_padre,
        ]);

        $query->andFilterWhere(['like', 'nombre_categoria', $this->nombre_categoria])
            ->andFilterWhere(['like', 'notas', $this->notas])
            ->andFilterWhere(['like', 'padre.nombre_categoria', $this->nombre_categoria_padre]);

        $query->andFilterHaving(['num_restaurantes' => $this->num_restaurantes]);

        return $dataProvider;
    }
}

