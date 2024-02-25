<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\resena;

/**
 * ResenaSearch represents the model behind the search form of `app\models\resena`.
 */
class ResenaSearch extends resena
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_resena', 'puntuacion', 'incidencia_resena', 'id_usuario', 'id_restaurante'], 'integer'],
            [['titulo_resena', 'cuerpo_resena', 'fecha_resena', 'notas'], 'safe'],
            [['precio_x_persona'], 'number'],
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
        $query = resena::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_resena' => $this->id_resena,
            'puntuacion' => $this->puntuacion,
            'precio_x_persona' => $this->precio_x_persona,
            'incidencia_resena' => $this->incidencia_resena,
            'fecha_resena' => $this->fecha_resena,
            'id_usuario' => $this->id_usuario,
            'id_restaurante' => $this->id_restaurante,
        ]);

        $query->andFilterWhere(['like', 'titulo_resena', $this->titulo_resena])
            ->andFilterWhere(['like', 'cuerpo_resena', $this->cuerpo_resena])
            ->andFilterWhere(['like', 'notas', $this->notas]);

        return $dataProvider;
    }
}
