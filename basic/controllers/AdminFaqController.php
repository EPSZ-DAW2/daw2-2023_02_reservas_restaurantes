<?php

namespace app\controllers;

use app\models\Configuracion as ModelsConfiguracion;
use app\models\RespuestasFaq;
use app\models\RespuestasFaqSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

use app\models\Configuracion;
use Yii;

/**
 * AdminFaqController implements the CRUD actions for RespuestasFaq model.
 */
class AdminFaqController extends Controller
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
                    'class' => VerbFilter::class,
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
     * Lists all RespuestasFaq models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new RespuestasFaqSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination->pageSize = Configuracion::findByNombreVariable('numElemsFAQ') ? Configuracion::findByNombreVariable('numElemsFAQ') : 10;

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single RespuestasFaq model.
     * @param int $id_pregunta Id Pregunta
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_pregunta)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_pregunta),
        ]);
    }

    /**
     * Creates a new RespuestasFaq model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new RespuestasFaq();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_pregunta' => $model->id_pregunta]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing RespuestasFaq model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_pregunta Id Pregunta
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_pregunta)
    {
        $model = $this->findModel($id_pregunta);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_pregunta' => $model->id_pregunta]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing RespuestasFaq model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_pregunta Id Pregunta
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_pregunta)
    {
        $this->findModel($id_pregunta)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the RespuestasFaq model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_pregunta Id Pregunta
     * @return RespuestasFaq the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_pregunta)
    {
        if (($model = RespuestasFaq::findOne(['id_pregunta' => $id_pregunta])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
