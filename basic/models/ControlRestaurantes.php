<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "control_restaurantes".
 *
 * @property int $id_usuario Referencia del usuario asociado al restaurante.
 * @property int $id_restaurante Identificador del restaurante asociado al gestor.
 * @property string|null $notas Notas internas para el control de restaurantes.
 *
 * @property Restaurantes $restaurante
 * @property Usuarios $usuario
 */
class ControlRestaurantes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'control_restaurantes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario', 'id_restaurante'], 'required'],
            [['id_usuario', 'id_restaurante'], 'integer'],
            [['notas'], 'string'],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::class, 'targetAttribute' => ['id_usuario' => 'id_usuario']],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurante::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_usuario' => Yii::t('app', 'Referencia del usuario asociado al restaurante.'),
            'id_restaurante' => Yii::t('app', 'Identificador del restaurante asociado al gestor.'),
            'notas' => Yii::t('app', 'Notas internas para el control de restaurantes.'),
        ];
    }

    /**
     * Gets query for [[Restaurante]].
     *
     * @return \yii\db\ActiveQuery|RestaurantesQuery
     */
    public function getRestaurante()
    {
        return $this->hasOne(Restaurante::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[Usuario]].
     *
     * @return \yii\db\ActiveQuery|UsuariosQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * {@inheritdoc}
     * @return ControlRestaurantesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ControlRestaurantesQuery(get_called_class());
    }
}
