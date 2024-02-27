<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "respuestas".
 *
 * @property int $id_respuesta Identificador de cada respuesta de resena.
 * @property int|null $id_respuesta_padre Identificador de la respuesta padre NULL si no tiene
 * @property string $texto_respuesta Texto de la respuesta.
 * @property int|null $incidencia_respuesta Marca de incidencia en una respuesta: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.
 * @property int $id_resena Identificador de cada resena asociada a la respuesta.
 * @property string|null $notas Notas internas para la respuesta de resena.
 */
class Respuestas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'respuestas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_respuesta', 'texto_respuesta', 'id_resena'], 'required'],
            [['id_respuesta', 'id_respuesta_padre', 'incidencia_respuesta', 'id_resena'], 'integer'],
            [['notas'], 'string'],
            [['texto_respuesta'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_respuesta' => 'Id Respuesta',
            'id_respuesta_padre' => 'Id Respuesta Padre',
            'texto_respuesta' => 'Texto Respuesta',
            'incidencia_respuesta' => 'Incidencia Respuesta',
            'id_resena' => 'Id Resena',
            'notas' => 'Notas',
        ];
    }

    public function getUsuario()
    {
        return $this->hasOne(Usuario::class, ['id_usuario' => 'id_usuario'])->viaTable('resenas', ['id_resena' => 'id_resena']);
    }

    public function getRespuestasHijas()
{
    return $this->hasMany(Respuestas::class, ['id_respuesta_padre' => 'id_respuesta']);
}
}
