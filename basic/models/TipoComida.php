<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipos_comida".
 *
 * @property int $id_tipo_comida Identificador de cada tipo de comida de restaurante.
 * @property int|null $id_tipo_padre Identificador del tipo de comida padre NULL si no tiene
 * @property string $nombre_tipo Nombre del tipo de comida.
 * @property string|null $notas Notas internas para el tipo.
 *
 * @property TipoRestaurante[] $tipoRestaurantes
 */
class TipoComida extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tipos_comida';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_tipo_padre'], 'integer'],
            [['nombre_tipo'], 'required'],
            [['notas'], 'string'],
            [['nombre_tipo'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_tipo_comida' => Yii::t('app', 'Identificador de cada tipo de comida de restaurante.'),
            'id_tipo_padre' => Yii::t('app', 'Identificador del tipo de comida padre NULL si no tiene'),
            'nombre_tipo' => Yii::t('app', 'Nombre del tipo de comida.'),
            'notas' => Yii::t('app', 'Notas internas para el tipo.'),
        ];
    }

    /**
     * Gets query for [[TipoRestaurantes]].
     *
     * @return \yii\db\ActiveQuery|TipoRestauranteQuery
     */
    public function getTipoRestaurantes()
    {
        return $this->hasMany(TipoRestaurante::class, ['id_tipo_comida' => 'id_tipo_comida']);
    }

    /**
     * {@inheritdoc}
     * @return TipoComidaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new TipoComidaQuery(get_called_class());
    }


    /**
     * Obtiene los nombres de todas los tipos y sus subtipos en la base de datos.
     * @return array Lista de tipos y sus subtipos
     */
    public static function obtenerTiposConPadre()
    {
        $tipos = TipoComida::find()->all();
        $tiposConPadre = [];

        foreach ($tipos as $tipo) {
            $tipoConPadre = [
                'tipo' => $tipo->nombre_tipo,
                'padre' => self::obtenerNombresTipoPadre($tipo),
            ];

            $tiposConPadre[] = $tipoConPadre;
        }

        return $tiposConPadre;
    }


    /**
     * Obtiene los nombres de los subtipos de un tipo dado.
     * @param TipoComida $tipo Tipo para la cual obtener las subtipos
     * @return array Lista de nombres de subtipos
     */
    private static function obtenerNombresTipoPadre($tipo)
    {
        $padre = $tipo->getPadre()->select('nombre_tipo')->scalar();
        return $padre;
    }
}
