<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "restaurantes".
 *
 * @property int $id_restaurante Identificador de cada restaurante.
 * @property string $nombre_restaurante Nombre del restaurante.
 * @property int $id_foto_restaurante ID de la foto de perfil del restaurante.
 * @property int $id_carta ID de la foto de la carta.
 * @property string $calle_restaurante Calle del restaurante.
 * @property string|null $barrio_restaurante Barrio del restaurante.
 * @property string $ciudad_restaurante Ciudad del restaurante.
 * @property string $comunidad_autonoma_restaurante Comunidad autónoma del restaurante.
 * @property float|null $precio_medio_comensal Precio por persona medio.
 * @property string|null $notas Notas internas para el restaurante.
 *
 * @property Imagen $carta
 * @property CategoriaRestaurante[] $categoriaRestaurantes
 * @property ControlRestaurante[] $controlRestaurantes
 * @property Evento[] $eventos
 * @property Favorito[] $favoritos
 * @property Imagen $fotoRestaurante
 * @property ImagenesRestaurante[] $imagenesRestaurantes
 * @property Resena[] $resenas
 * @property Reserva[] $reservas
 * @property TipoRestaurante[] $tipoRestaurantes
 */
class Restaurante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'restaurantes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre_restaurante', 'id_foto_restaurante', 'id_carta', 'calle_restaurante', 'ciudad_restaurante', 'comunidad_autonoma_restaurante'], 'required'],
            [['id_foto_restaurante', 'id_carta'], 'integer'],
            [['precio_medio_comensal'], 'number'],
            [['notas'], 'string'],
            [['nombre_restaurante', 'calle_restaurante', 'barrio_restaurante', 'ciudad_restaurante', 'comunidad_autonoma_restaurante'], 'string', 'max' => 100],
            [['id_foto_restaurante'], 'exist', 'skipOnError' => true, 'targetClass' => Imagen::class, 'targetAttribute' => ['id_foto_restaurante' => 'id_imagen']],
            [['id_carta'], 'exist', 'skipOnError' => true, 'targetClass' => Imagen::class, 'targetAttribute' => ['id_carta' => 'id_imagen']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_restaurante' => 'Id Restaurante',
            'nombre_restaurante' => 'Nombre Restaurante',
            'id_foto_restaurante' => 'Id Foto Restaurante',
            'id_carta' => 'Id Carta',
            'calle_restaurante' => 'Calle Restaurante',
            'barrio_restaurante' => 'Barrio Restaurante',
            'ciudad_restaurante' => 'Ciudad Restaurante',
            'comunidad_autonoma_restaurante' => 'Comunidad Autonoma Restaurante',
            'precio_medio_comensal' => 'Precio Medio Comensal',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[Carta]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCarta()
    {
        return $this->hasOne(Imagen::class, ['id_imagen' => 'id_carta']);
    }

    /**
     * Gets query for [[CategoriaRestaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoriaRestaurantes()
    {
        return $this->hasMany(CategoriaRestaurante::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[ControlRestaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getControlRestaurantes()
    {
        return $this->hasMany(ControlRestaurante::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[Eventos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEventos()
    {
        return $this->hasMany(Evento::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[Favoritos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFavoritos()
    {
        return $this->hasMany(Favorito::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[FotoRestaurante]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFotoRestaurante()
    {
        return $this->hasOne(Imagen::class, ['id_imagen' => 'id_foto_restaurante']);
    }

    /**
     * Gets query for [[ImagenesRestaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagenesRestaurantes()
    {
        return $this->hasMany(ImagenesRestaurante::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[Resenas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getResenas()
    {
        return $this->hasMany(Resena::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[Reservas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getReservas()
    {
        return $this->hasMany(Reserva::class, ['id_restaurante' => 'id_restaurante']);
    }

    /**
     * Gets query for [[TipoRestaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipoRestaurantes()
    {
        return $this->hasMany(TipoRestaurante::class, ['id_restaurante' => 'id_restaurante']);
    }

    //Función que devuelve la puntuación promedio del restaurante
    public function getPuntuacionPromedio()
    {
        $resenas = $this->getResenas()->all();
        $totalPuntuacion = 0;
        $numResenas = count($resenas);

        foreach ($resenas as $resena) {
            $totalPuntuacion += $resena->puntuacion;
        }

        return $numResenas > 0 ? $totalPuntuacion / $numResenas : 0;
    }

    //Función que devuelve el número de reseñas del restaurante
    public function getNumResenas()
    {
        $resenas = $this->getResenas()->all();
        return count($resenas);
    }
    
}
