<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "imagenes".
 *
 * @property int $id_imagen Identificador de imagen.
 * @property string|null $descripcion Texto que describe la imagen y se muestra como pié de foto (opcional).
 * @property string|null $notas Notas internas para la imagen.
 *
 * @property Evento[] $eventos
 * @property ImagenesResena[] $imagenesResenas
 * @property ImagenesRestaurante[] $imagenesRestaurantes
 * @property Restaurante[] $restaurantes
 * @property Restaurante[] $restaurantes0
 * @property Usuario[] $usuarios
 */
class Imagen extends \yii\db\ActiveRecord
{

    public $archivo; //esto tiene que ser subido por la clase yii\web\UploadedFile

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'imagenes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['notas'], 'string'],
            [['descripcion'], 'string', 'max' => 500],
            [['archivo'], 'file', 'extensions' => 'jpg, png']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_imagen' => 'Id Imagen',
            'descripcion' => 'Descripcion',
            'notas' => 'Notas',
        ];
    }

    /**
     * Gets query for [[Eventos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEventos()
    {
        return $this->hasMany(Evento::class, ['id_imagen_promocional' => 'id_imagen']);
    }

    /**
     * Gets query for [[ImagenesResenas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagenesResenas()
    {
        return $this->hasMany(ImagenResena::class, ['id_imagen' => 'id_imagen']);
    }

    /**
     * Gets query for [[ImagenesRestaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImagenesRestaurantes()
    {
        return $this->hasMany(ImagenesRestaurante::class, ['id_imagen' => 'id_imagen']);
    }

    /**
     * Gets query for [[Restaurantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRestaurantes()
    {
        return $this->hasMany(Restaurante::class, ['id_foto_restaurante' => 'id_imagen']);
    }

    /**
     * Gets query for [[Restaurantes0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRestaurantes0()
    {
        return $this->hasMany(Restaurante::class, ['id_carta' => 'id_imagen']);
    }

    /**
     * Gets query for [[Usuarios]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarios()
    {
        return $this->hasMany(Usuario::class, ['id_foto_usuario' => 'id_imagen']);
    }

    /*
        A continuación se presenta un sistema probablemente demasiado arcaico para
        guardar y obtener imágenes basado en el id que se encuentra en la bbdd
        Imagino que hay mejores métodos pero sin tener el nombre de archivo ni la ruta en la bbdd
        esto es lo mejor que se me ocurre.
        Los archivos se guardan como id_imagen-extension.extension para poder obtener el archivo
        posteriormente xD
    */

    //funcion para guardar una imagen o archivo
    public function guardarImagen()
    {
        if ($this->validate()) {
            //una vez guardado el modelo en bbdd se guarda la imagen con el id como nombrae
            if ($this->save()) {
                $nombre = $this->id_imagen . '-' . $this->archivo->extension . '.' . $this->archivo->extension; //se agrega la extensión al nombre para poder obtenerlo despúes
                $this->archivo->saveAs(Yii::getAlias('@app/web/multimedia/') . $nombre);
                $this->archivo = null;
                return true;
            }
        }
        return false;
    }

    //función para eliminar una imagen
    public function eliminarImagen()
    {
        $extension = $this->getExtension();
        if ($extension) {
            $fichero = Yii::getAlias('@app/web/multimedia/' . $this->id_imagen . '-' . $extension . '.' . $extension);
            if (file_exists($fichero)) {
                try {
                    unlink($fichero);
                } catch (\Throwable $e) {
                    Yii::$app->session->setFlash('error', "No se ha podido eliminar el fichero: " . $e->getMessage());
                    return false;
                }
            } else {
                Yii::$app->session->setFlash('error', "No existe: " . $fichero);
                return false;
            }
        } else {
            Yii::$app->session->setFlash('error', "Extension invalida");
            return false;
        }
        return true;
    }

    //función para extraer la extensión de un archivo de su nombre
    private function getExtension()
    {

        $files = glob(Yii::getAlias('@app/web/multimedia/' . $this->id_imagen . '-*'));
        if ($files) {
            return pathinfo($files[0], PATHINFO_EXTENSION);
        }
        return null;
    }

    //función que devuelve el url de un archivo para ser mostrado
    public function getUrlImagen()
    {

        $extension = $this->getExtension();
        if ($extension) {
            return Yii::getAlias('@web/multimedia/' . $this->id_imagen . '-' . $extension . '.' . $extension);
        }
        return null;
    }

}

