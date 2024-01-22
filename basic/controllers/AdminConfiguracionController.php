<?php

namespace app\controllers;

use app\models\Configuracion;
use app\models\ConfiguracionSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AdminConfiguracionController implements the CRUD actions for Configuracion model.
 */
class AdminConfiguracionController extends Controller
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
     * Lists all Configuracion models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ConfiguracionSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Configuracion model.
     * @param string $nombre_variable Nombre de la variable.
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($nombre_variable)
    {
        return $this->render('view', [
            'model' => $this->findModel($nombre_variable),
        ]);
    }

    /**
     * Creates a new Configuracion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Configuracion();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'nombre_variable' => $model->nombre_variable]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Configuracion model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $nombre_variable Nombre de la variable.
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($nombre_variable)
    {
        $model = $this->findModel($nombre_variable);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'nombre_variable' => $model->nombre_variable]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Configuracion model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $nombre_variable Nombre de la variable.
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($nombre_variable)
    {
        $this->findModel($nombre_variable)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Configuracion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $nombre_variable Nombre de la variable.
     * @return Configuracion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($nombre_variable)
    {
        if (($model = Configuracion::findOne(['nombre_variable' => $nombre_variable])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
