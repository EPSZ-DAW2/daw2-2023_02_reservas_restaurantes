<?php

/*
    Pendiente:
        - Eliminar fotos del servidor tras eliminación de la tupla
        - Modificar fotos del servidor tras modificación de la tupla
*/

namespace app\controllers;

use app\models\Imagen;
use app\models\ImagenSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

use app\models\Configuracion;

use Yii;
use yii\data\ArrayDataProvider;
use yii\helpers\Url;

/**
 * AdminImagenesController implements the CRUD actions for Imagen model.
 */
class AdminImagenesController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * @inheritDoc
     */
    public function beforeAction($action)
    {
        $userRoles = Yii::$app->authManager->getRolesByUser(Yii::$app->user->id);

        // Verificar si el usuario tiene el rol de administrador
        if (!isset($userRoles['administrador'])) {
            return $this->goHome();
        }

        return parent::beforeAction($action);
    }

    /**
     * Lists all Imagen models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ImagenSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination->pageSize = Configuracion::findByNombreVariable('numElemsIMG') ? Configuracion::findByNombreVariable('numElemsIMG') : 10;

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Imagen model.
     * @param int $id_imagen Id Imagen
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_imagen)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_imagen),
        ]);
    }

    /**
     * Creates a new Imagen model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Imagen();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                $model->archivo = UploadedFile::getInstance($model, 'archivo'); //se agrega la imagen al modelo
                if ($model->guardarImagen()) {
                    return $this->redirect(['view', 'id_imagen' => $model->id_imagen]);
                }else{
                    $model->delete();
                }
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Imagen model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_imagen Id Imagen
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_imagen)
    {
        $model = $this->findModel($id_imagen);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            //se elimina la imagen anterior
            $model->eliminarImagen();
            $model->archivo = UploadedFile::getInstance($model, 'archivo'); //se agrega la imagen al modelo
            if ($model->guardarImagen()) {
                return $this->redirect(['view', 'id_imagen' => $model->id_imagen]);
            }else{
                $model->delete();
            }
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Imagen model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_imagen Id Imagen
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_imagen)
    {
        try {
            //se crea una copia del modelo para eliminar la imagen
            $model = $this->findModel($id_imagen);
            $this->findModel($id_imagen)->delete();
        } catch (\Throwable $e) {
            Yii::$app->session->setFlash('error', 'No se puede eliminar esta imagen debido a que tiene relaciones activas.');
            return $this->redirect(['index']);
        }

        $model->eliminarImagen(); //si se ha eliminado la imagen de la bbdd se elimina la imagen del servidor
        return $this->redirect(['index']);
    }



    /**
     * Finds the Imagen model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_imagen Id Imagen
     * @return Imagen the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_imagen)
    {
        if (($model = Imagen::findOne(['id_imagen' => $id_imagen])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    //muestra la lista de imágenes 'sueltas' para depurar
    public function actionListaDepurar()
    {
        //obtener el url de todas las imágenes en web/multimedia
        $imagenesSistema = glob(Yii::getAlias('@app/web/multimedia/*'));
        //obtener todas las imágenes en la bbdd
        $imagenes = Imagen::find()->all();
        $imagenesBaseDatos = [];
        foreach ($imagenes as $imagen)
        {
            $imagenesBaseDatos[] = $imagen->urlSistema;
        }
        //obtener las imágenes que no están en la bbdd
        $imagenesSueltas = array_diff($imagenesSistema, $imagenesBaseDatos);

        $dataProvider = new ArrayDataProvider([
            'allModels' => $imagenesSueltas,
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $this->render('depurar', [
            'dataProvider' => $dataProvider,
        ]);
    }

    public static function actionEliminar($url)
    {
        //se elimina la url
        try{
            unlink($url);
        }catch(\Throwable $e){
            Yii::$app->session->setFlash('error', 'No se ha podido eliminar la imagen: ' . $e->getMessage());
        }
        return Yii::$app->getResponse()->redirect(Url::to(['lista-depurar']));

    }

    //elimina todas las imágenes 'sueltas' 
    public function actionDepurar()
    {
        //obtener el url de todas las imágenes en web/multimedia
        $imagenesSistema = glob(Yii::getAlias('@app/web/multimedia/*'));
        //obtener todas las imágenes en la bbdd
        $imagenes = Imagen::find()->all();
        $imagenesBaseDatos = [];
        foreach ($imagenes as $imagen)
        {
            $imagenesBaseDatos[] = $imagen->urlSistema;
        }
        //obtener las imágenes que no están en la bbdd
        $imagenesSueltas = array_diff($imagenesSistema, $imagenesBaseDatos);
        foreach($imagenesSueltas as $img)
        {
            AdminImagenesController::actionEliminar($img);
        }
    }

}
