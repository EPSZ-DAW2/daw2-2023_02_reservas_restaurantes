<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "gestores".
 *
 * @property int $id_gestor Identificador de cada gestor.
 * @property int $es_propietario Si el gestor es propietario o solo gestor, 0 solo gestor 1 propietario.
 * @property int $id_usuario Identificador asociado a cada usuario.
 * @property string|null $notas Notas internas para el Gestor
 *
 * @property ControlRestaurantes[] $controlRestaurantes
 * @property Usuarios $usuario
 */
class Gestor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'gestores';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['es_propietario', 'id_usuario'], 'required'],
            [['es_propietario', 'id_usuario'], 'integer'],
            [['notas'], 'string'],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['id_usuario' => 'id_usuario']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_gestor' => Yii::t('app', 'Identificador de cada gestor.'),
            'es_propietario' => Yii::t('app', 'Si el gestor es propietario o solo gestor, 0 solo gestor 1 propietario.'),
            'id_usuario' => Yii::t('app', 'Identificador asociado a cada usuario.'),
            'notas' => Yii::t('app', 'Notas internas para el Gestor'),
        ];
    }

    /**
     * Gets query for [[ControlRestaurantes]].
     *
     * @return \yii\db\ActiveQuery|ControlRestaurantesQuery
     */
    public function getControlRestaurantes()
    {
        return $this->hasMany(ControlRestaurantes::class, ['id_gestor' => 'id_gestor']);
    }

    /**
     * Gets query for [[Usuario]].
     *
     * @return \yii\db\ActiveQuery|UsuariosQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(User::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * {@inheritdoc}
     * @return ClientesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ClientesQuery(get_called_class());
    }
}
