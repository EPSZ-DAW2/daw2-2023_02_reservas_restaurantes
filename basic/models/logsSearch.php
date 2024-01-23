<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\logs;

/**
 * logsSearch represents the model behind the search form of `app\models\logs`.
 */
class logsSearch extends logs
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_log'], 'integer'],
            [['tipo_log', 'texto_log', 'fecha_hora', 'notas'], 'safe'],
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
        $query = logs::find();

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
            'id_log' => $this->id_log,
        ]);

        $query->andFilterWhere(['like', 'tipo_log', $this->tipo_log])
            ->andFilterWhere(['like', 'texto_log', $this->texto_log])
            ->andFilterWhere(['like', 'fecha_hora', $this->fecha_hora])
            ->andFilterWhere(['like', 'notas', $this->notas]);

        return $dataProvider;
    }
}
