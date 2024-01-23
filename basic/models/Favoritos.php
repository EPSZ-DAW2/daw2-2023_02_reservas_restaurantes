<?php
// app\models\Favoritos.php

namespace app\models;

use Yii;

class Favoritos extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'favoritos';
    }
	public static function primaryKey()
{
    return ['id_usuario', 'id_restaurante'];
}


    public function rules()
    {
        return [
            [['id_usuario', 'id_restaurante'], 'required'],
            [['id_usuario', 'id_restaurante'], 'integer'],
            [['id_usuario', 'id_restaurante'], 'unique', 'targetAttribute' => ['id_usuario', 'id_restaurante']],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::class, 'targetAttribute' => ['id_usuario' => 'id_usuario']],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurante::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id_usuario' => 'Id Usuario',
            'id_restaurante' => 'Id Restaurante',
        ];
    }

    public function getUsuario()
    {
        return $this->hasOne(Usuario::class, ['id_usuario' => 'id_usuario']);
    }

    public function getRestaurante()
    {
        return $this->hasOne(Restaurante::class, ['id_restaurante' => 'id_restaurante']);
    }
}
