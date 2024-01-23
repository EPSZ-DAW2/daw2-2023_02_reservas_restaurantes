<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "reservas".
 *
 * @property int $id_reserva Identificador de cada reserva.
 * @property string $datos_pago Datos de pago dados por el cliente.
 * @property int $num_comensales Número de comensales para la reserva.
 * @property string $fecha_reserva Fecha de la reserva.
 * @property string $hora_reserva Hora seleccionada por el cliente para la reserva (Ej: 21:00).
 * @property int $id_usuario Referencia del usuario asociado a la reserva.
 * @property int $id_restaurante Identificador del restaurante asociado a la reserva.
 * @property string|null $notas Notas internas para la reserva.
 *
 * @property Restaurantes $restaurante
 * @property Usuarios $usuario
 */
class Reserva extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'reservas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['datos_pago', 'num_comensales', 'fecha_reserva', 'hora_reserva', 'id_usuario', 'id_restaurante'], 'required'],
            [['num_comensales', 'id_usuario', 'id_restaurante'], 'integer'],
            [['fecha_reserva'], 'safe'],
            [['notas'], 'string'],
            [['datos_pago'], 'string', 'max' => 100],
            [['hora_reserva'], 'string', 'max' => 5],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::class, 'targetAttribute' => ['id_usuario' => 'id_usuario']],
            [['id_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Restaurante::class, 'targetAttribute' => ['id_restaurante' => 'id_restaurante']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_reserva' => Yii::t('app', 'ID.'),
            'datos_pago' => Yii::t('app', 'Datos Pago Cliente.'),
            'num_comensales' => Yii::t('app', 'Num Comensales.'),
            'fecha_reserva' => Yii::t('app', 'Fecha.'),
            'hora_reserva' => Yii::t('app', 'Hora.'),
            'id_usuario' => Yii::t('app', 'ID Cliente.'),
            'id_restaurante' => Yii::t('app', 'ID Restaurante.'),
            'notas' => Yii::t('app', 'Notas.'),
        ];
    }

    /**
     * Gets query for [[Restaurante]].
     *
     * @return \yii\db\ActiveQuery|RestaurantesQuery
     */
    public function getRestaurante()
    {
        return $this->hasOne(Restaurante::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[Usuario]].
     *
     * @return \yii\db\ActiveQuery|UsuariosQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::class, ['id_usuario' => 'id_usuario']);
    }

    /**
     * {@inheritdoc}
     * @return ReservaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ReservaQuery(get_called_class());
    }

    /**
     * Obtiene las reservas de un usuario a través de la tabla control_restaurantes y la tabla restaurante.
     *
     * @param int $idUsuario ID del usuario.
     * @return Reserva[]|null Arreglo de modelos Reserva o null si no se encuentran reservas.
     */
    public static function findReservasPorUsuario($idUsuario)
    {
        // Obtener los IDs de los restaurantes asociados al usuario desde la tabla control_restaurantes
        $restaurantesIds = ControlRestaurantes::find()
            ->select('id_restaurante')
            ->where(['id_usuario' => $idUsuario])
            ->column();

        // Obtener las reservas asociadas a los restaurantes encontrados
        $reservas = Reserva::find()
            ->where(['id_restaurante' => $restaurantesIds])
            ->all();

        return $reservas;
    }
const SCENARIO_UPDATE_CLIENTE = 'update_cliente';

    public function scenarios()
    {
        $scenarios = parent::scenarios();

        // Agrega un nuevo escenario llamado 'update_cliente' y especifica los atributos permitidos
        $scenarios[self::SCENARIO_UPDATE_CLIENTE] = ['fecha_reserva', 'hora_reserva', 'num_comensales'];

        return $scenarios;
    }


}
