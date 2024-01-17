<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "clientes".
 *
 * @property int $id_cliente Identificador de cada cliente.
 * @property int $id_usuario Identificador asociado a cada usuario.
 * @property string|null $notas Notas internas para el Cliente
 *
 * @property Favoritos[] $favoritos
 * @property Resenas[] $resenas
 * @property Reservas[] $reservas
 * @property Usuarios $usuario
 */
class Cliente extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'clientes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario'], 'required'],
            [['id_usuario'], 'integer'],
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
            'id_cliente' => Yii::t('app', 'Identificador de cada cliente.'),
            'id_usuario' => Yii::t('app', 'Identificador asociado a cada usuario.'),
            'notas' => Yii::t('app', 'Notas internas para el Cliente'),
        ];
    }

    /**
     * Gets query for [[Favoritos]].
     *
     * @return \yii\db\ActiveQuery|FavoritosQuery
     */
    public function getFavoritos()
    {
        return $this->hasMany(Favoritos::class, ['id_cliente' => 'id_cliente']);
    }

    /**
     * Gets query for [[Resenas]].
     *
     * @return \yii\db\ActiveQuery|ResenasQuery
     */
    public function getResenas()
    {
        return $this->hasMany(Resenas::class, ['id_cliente' => 'id_cliente']);
    }

    /**
     * Gets query for [[Reservas]].
     *
     * @return \yii\db\ActiveQuery|ReservasQuery
     */
    public function getReservas()
    {
        return $this->hasMany(Reservas::class, ['id_cliente' => 'id_cliente']);
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
