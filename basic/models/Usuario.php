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
 * @property int $id_foto_usuario ID de la foto de perfil del usuario.
 * @property int|null $es_gestor_propietario 0 gestor y 1 propietario. NULL para el resto de usuarios.
 * @property string|null $notas Notas internas para el usuario.
 *
 * @property Comentarios[] $comentarios
 * @property ControlRestaurantes[] $controlRestaurantes
 * @property Favoritos[] $favoritos
 * @property Imagenes $fotoUsuario
 * @property Moderadores[] $moderadores
 * @property Resenas[] $resenas
 * @property Reservas[] $reservas
 * @property Restaurantes[] $restaurantes
 */
class Usuario extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{


    public $authKey;

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
            [['nombre_usuario', 'email', 'password', 'id_foto_usuario'], 'required'],
            [['id_foto_usuario', 'es_gestor_propietario'], 'integer'],
            [['notas'], 'string'],
            [['nombre_usuario'], 'string', 'max' => 50],
            [['email'], 'string', 'max' => 32],
            [['password'], 'string', 'max' => 200],
            [['id_foto_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Imagen::class, 'targetAttribute' => ['id_foto_usuario' => 'id_imagen']],
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
            'id_foto_usuario' => Yii::t('app', 'ID de la foto de perfil del usuario.'),
            'es_gestor_propietario' => Yii::t('app', '0 gestor y 1 propietario. NULL para el resto de usuarios.'),
            'notas' => Yii::t('app', 'Notas internas para el usuario.'),
        ];
    }

    /**
     * Gets query for [[Comentarios]].
     *
     * @return \yii\db\ActiveQuery|ComentariosQuery
     */
    public function getComentarios()
    {
        return $this->hasMany(Comentario::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[ControlRestaurantes]].
     *
     * @return \yii\db\ActiveQuery|ControlRestaurantesQuery
     */
    public function getControlRestaurantes()
    {
        return $this->hasMany(ControlRestaurante::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Favoritos]].
     *
     * @return \yii\db\ActiveQuery|FavoritosQuery
     */
    public function getFavoritos()
    {
        return $this->hasMany(Favorito::class, ['id_usuario' => 'id_usuario']);
    }




    /**
     * Gets query for [[Moderadores]].
     *
     * @return \yii\db\ActiveQuery|ModeradoresQuery
     */
    public function getModeradores()
    {
        return $this->hasMany(Moderador::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Resenas]].
     *
     * @return \yii\db\ActiveQuery|ResenasQuery
     */
    public function getResenas()
    {
        return $this->hasMany(Resena::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Reservas]].
     *
     * @return \yii\db\ActiveQuery|ReservasQuery
     */
    public function getReservas()
    {
        return $this->hasMany(Reserva::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[Restaurantes]].
     *
     * @return \yii\db\ActiveQuery|RestaurantesQuery
     */
    public function getRestaurantes()
    {
        return $this->hasMany(Restaurante::class, ['id_propietario' => 'id_usuario']);
    }

    /**
     * {@inheritdoc}
     * @return UsuarioQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UsuarioQuery(get_called_class());
    }


    public function getFotoUsuario()
    {
        $imagen = Imagen::findOne($this->id_foto_usuario);
        return $imagen ? $imagen->getUrlImagen() : null;
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

    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password);
    }





    public static function findIdentity($id_usuario)
    {
        return static::findOne(['id_usuario' => $id_usuario]);
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['accessToken' => $token]);
    }

    /**
     * Encuentra al usuario por nombre de usuario
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($nombre_usuario)
    {
        return static::findOne(['nombre_usuario' => $nombre_usuario]);
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id_usuario;
    }

    // /**
    //  * {@inheritdoc}
    //  */
    // public function getAuthKey()
    // {
    //     // Si no existe authKey, genera una nueva
    //     if ($this->authKey === null) {
    //         $this->authKey = Yii::$app->security->generateRandomString();
    //         $this->save(false);  // Guarda el usuario sin validar las reglas de validación
    //     }

    //     return $this->authKey;
    // }

    // /**
    //  * {@inheritdoc}
    //  */
    // public function validateAuthKey($authKey)
    // {
    //     return $this->authKey === $authKey;
    // }

        /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        // No es necesario generar un authKey si no existe en la base de datos.
        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        // No es necesario validar authKey si no existe en la base de datos.
        return true;
    }


}
