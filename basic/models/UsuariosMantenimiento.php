<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuarios".
 *
 * @property int $id_usuario Identificador de cada usuario.
 * @property string $nombre_usuario Nombre del usuario.
 * @property string $email Email de regitro del usuario.
 * @property string $password Contraseña de registro del usuario.
 * @property int|null $id_foto_usuario ID de la foto de perfil del usuario. NULL si no tiene.
 * @property string|null $notas Notas internas para el usuario.
 *
 * @property Administradores[] $administradores
 * @property Clientes[] $clientes
 * @property Comentarios[] $comentarios
 * @property Imagenes $fotoUsuario
 * @property Gestores[] $gestores
 * @property Moderadores[] $moderadores
 */
class UsuariosMantenimiento extends \yii\db\ActiveRecord
{
    public $plain_password;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'usuarios';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
         return [
            [['nombre_usuario', 'email', 'password', 'rol', 'bloqueado'], 'required'],
            [['bloqueado', 'id_foto_usuario'], 'integer'],
            [['notas'], 'string'],
            [['nombre_usuario', 'rol'], 'string', 'max' => 50],
            [['email'], 'string', 'max' => 32],
            [['password'], 'string', 'max' => 255],
            [['id_foto_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Imagen::class, 'targetAttribute' => ['id_foto_usuario' => 'id_imagen']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
         return [
            [['nombre_usuario', 'email', 'password', 'rol', 'bloqueado'], 'required'],
            [['bloqueado', 'id_foto_usuario'], 'integer'],
            [['notas'], 'string'],
            [['nombre_usuario', 'rol'], 'string', 'max' => 50],
            [['email', 'password'], 'string', 'max' => 32],
            [['id_foto_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Imagen::class, 'targetAttribute' => ['id_foto_usuario' => 'id_imagen']],
        ];
    }

    /**
     * Gets query for [[Administradores]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAdministradores()
    {
        return $this->hasMany(Administradores::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Clientes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClientes()
    {
        return $this->hasMany(Clientes::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Comentarios]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getComentarios()
    {
        return $this->hasMany(Comentarios::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[FotoUsuario]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFotoUsuario()
    {
        return $this->hasOne(Imagen::class, ['id_imagen' => 'id_foto_usuario']);
    }

    /**
     * Gets query for [[Gestores]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGestores()
    {
        return $this->hasMany(Gestores::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Moderadores]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModeradores()
    {
        return $this->hasMany(Moderadores::class, ['id_usuario' => 'id_usuario']);
    }
	
	
}
