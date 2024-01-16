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
class User extends \yii\db\ActiveRecord
{

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
            [['nombre_usuario', 'email', 'password'], 'required'],
            [['id_foto_usuario'], 'integer'],
            [['notas'], 'string'],
            [['nombre_usuario'], 'string', 'max' => 50],
            [['email'], 'string', 'max' => 32],
            [['password'], 'string', 'max' => 200],
            //[['id_foto_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Imagenes::class, 'targetAttribute' => ['id_foto_usuario' => 'id_imagen']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_usuario' => Yii::t('app', 'Identificador de cada usuario.'),
            'nombre_usuario' => Yii::t('app', 'Nombre del usuario.'),
            'email' => Yii::t('app', 'Email de regitro del usuario.'),
            'password' => Yii::t('app', 'Contraseña de registro del usuario.'),
            'id_foto_usuario' => Yii::t('app', 'ID de la foto de perfil del usuario. NULL si no tiene.'),
            'notas' => Yii::t('app', 'Notas internas para el usuario.'),
        ];
    }

    /**
     * Gets query for [[Administradores]].
     *
     * @return \yii\db\ActiveQuery|AdministradoresQuery
     */
    public function getAdministradores()
    {
        return $this->hasMany(Administradores::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Clientes]].
     *
     * @return \yii\db\ActiveQuery|ClientesQuery
     */
    public function getClientes()
    {
        return $this->hasMany(Clientes::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Comentarios]].
     *
     * @return \yii\db\ActiveQuery|ComentariosQuery
     */
    public function getComentarios()
    {
        return $this->hasMany(Comentarios::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[FotoUsuario]].
     *
     * @return \yii\db\ActiveQuery|ImagenesQuery
     */
    public function getFotoUsuario()
    {
        return $this->hasOne(Imagenes::class, ['id_imagen' => 'id_foto_usuario']);
    }

    /**
     * Gets query for [[Gestores]].
     *
     * @return \yii\db\ActiveQuery|GestoresQuery
     */
    public function getGestores()
    {
        return $this->hasMany(Gestores::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Moderadores]].
     *
     * @return \yii\db\ActiveQuery|ModeradoresQuery
     */
    public function getModeradores()
    {
        return $this->hasMany(Moderadores::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * {@inheritdoc}
     * @return UsuariosQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UserQuery(get_called_class());
    }


    /**
     * Finds a user by their username.
     *
     * @param string $username
     * @return User|array|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['nombre_usuario' => $username]);
    }


    /**
     * Sets the user's password and hashes it using Yii's security methods.
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = Yii::$app->security->generatePasswordHash($password);
    }
}
