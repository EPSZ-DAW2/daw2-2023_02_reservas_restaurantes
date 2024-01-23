<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "logs".
 *
 * @property int $id_log Identificador del log.
 * @property string $tipo_log Tipo del log.
 * @property string $texto_log Texto informatico dado.
 * @property string $fecha_hora Fecha y hora del log.
 * @property string|null $notas Notas internas para los log.
 */
class Logs extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'logs';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tipo_log', 'texto_log', 'fecha_hora'], 'required'],
            [['notas'], 'string'],
            [['tipo_log'], 'string', 'max' => 100],
            [['texto_log'], 'string', 'max' => 500],
            [['fecha_hora'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_log' => 'Id Log',
            'tipo_log' => 'Tipo Log',
            'texto_log' => 'Texto Log',
            'fecha_hora' => 'Fecha Hora',
            'notas' => 'Notas',
        ];
    }
}
