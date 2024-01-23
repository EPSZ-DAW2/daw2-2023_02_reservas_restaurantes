<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "comentarios".
 *
 * @property int $id_comentario Identificador del comentario.
 * @property int|null $id_usuario Identificador del usuario que hace el comentario.
 * @property string $comentario El comentario en sí
 * @property string|null $notas Notas internas para los comentarios.
 *
 * @property Usuario $usuario
 */
class Comentario extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'comentarios';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario'], 'integer'],
            [['comentario'], 'required'],
            [['comentario', 'notas'], 'string'],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::class, 'targetAttribute' => ['id_usuario' => 'id_usuario']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_comentario' => 'Id Comentario',
            'id_usuario' => 'Id Usuario',
            'comentario' => 'Comentario',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[Usuario]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::class, ['id_usuario' => 'id_usuario']);
    }
}
