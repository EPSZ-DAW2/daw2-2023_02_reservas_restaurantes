<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "configuraciones".
 *
 * @property string $nombre_variable Nombre de la variable.
 * @property string $valor_variable Valor de la variable.
 * @property string|null $notas Notas internas para las variables.
 */
class Configuracion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'configuraciones';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre_variable', 'valor_variable'], 'required'],
            [['notas'], 'string'],
            [['nombre_variable', 'valor_variable'], 'string', 'max' => 50],
            [['nombre_variable'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'nombre_variable' => Yii::t('app', 'Nombre CONF.'),
            'valor_variable' => Yii::t('app', 'Valor CONF.'),
            'notas' => Yii::t('app', 'Notas.'),
        ];
    }

    /**
     * {@inheritdoc}
     * @return ConfiguracionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ConfiguracionQuery(get_called_class());
    }

    /*
        DEVOLVERÁ EL VALOR DE UNA VARIABLE POR SU NOMBRE
    */
    public static function findByNombreVariable($nombreVariable)
    {
        $configuracion = self::findOne(['nombre_variable' => $nombreVariable]);

        return $configuracion ? $configuracion->valor_variable : null;
    }
}
