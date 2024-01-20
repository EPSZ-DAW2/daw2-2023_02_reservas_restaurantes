<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_restaurante".
 *
 * @property int $id_tipo_comida Identificador del tipo de comida.
 * @property int $id_restaurante Identificador del restaurante.
 * @property string|null $notas Notas internas para la relacion.
 *
 * @property Restaurantes $restaurante
 * @property TiposComida $tipoComida
 */
class TipoRestaurante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tipo_restaurante';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_tipo_comida', 'id_restaurante'], 'required'],
            [['id_tipo_comida', 'id_restaurante'], 'integer'],
            [['notas'], 'string'],
            [['id_tipo_comida'], 'exist', 'skipOnError' => true, 'targetClass' => TiposComida::class, 'targetAttribute' => ['id_tipo_comida' => 'id_tipo_comida']],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurantes::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_tipo_comida' => Yii::t('app', 'Identificador del tipo de comida.'),
            'id_restaurante' => Yii::t('app', 'Identificador del restaurante.'),
            'notas' => Yii::t('app', 'Notas internas para la relacion.'),
        ];
    }

    /**
     * Gets query for [[Restaurante]].
     *
     * @return \yii\db\ActiveQuery|RestaurantesQuery
     */
    public function getRestaurante()
    {
        return $this->hasOne(Restaurantes::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[TipoComida]].
     *
     * @return \yii\db\ActiveQuery|TiposComidaQuery
     */
    public function getTipoComida()
    {
        return $this->hasOne(TiposComida::class, ['id_tipo_comida' => 'id_tipo_comida']);
    }

    /**
     * {@inheritdoc}
     * @return TipoRestauranteQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new TipoRestauranteQuery(get_called_class());
    }
}
