<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "respuestas_faq".
 *
 * @property int $id_pregunta Identificador de la pregunta FAQ.
 * @property string $pregunta Pregunta a responder.
 * @property string $respuesta Respuesta dada.
 * @property string|null $notas Notas internas para las preguntas FAQ.
 */
class RespuestasFaq extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'respuestas_faq';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['pregunta', 'respuesta'], 'required'],
            [['notas'], 'string'],
            [['pregunta', 'respuesta'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_pregunta' => 'Id Pregunta',
            'pregunta' => 'Pregunta',
            'respuesta' => 'Respuesta',
            'notas' => 'Notas',
        ];
    }
}
