<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Reserva;

/**
 * ReservaSearch represents the model behind the search form of `app\models\Reserva`.
 */
class ReservaSearch extends Reserva
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_reserva', 'num_comensales', 'id_usuario', 'id_restaurante'], 'integer'],
            [['datos_pago', 'fecha_reserva', 'hora_reserva', 'notas'], 'safe'],
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
        $query = Reserva::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => Configuracion::findByNombreVariable('numElemsReservas'),
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_reserva' => $this->id_reserva,
            'num_comensales' => $this->num_comensales,
            'fecha_reserva' => $this->fecha_reserva,
            'id_usuario' => $this->id_usuario,
            'id_restaurante' => $this->id_restaurante,
        ]);

        $query->andFilterWhere(['like', 'datos_pago', $this->datos_pago])
            ->andFilterWhere(['like', 'hora_reserva', $this->hora_reserva])
            ->andFilterWhere(['like', 'notas', $this->notas]);

        return $dataProvider;
    }
}
