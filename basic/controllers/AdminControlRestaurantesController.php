<?php

namespace app\controllers;

use app\models\ControlRestaurantes;
use app\models\ControlRestaurantesSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AdminControlRestaurantesController implements the CRUD actions for ControlRestaurantes model.
 */
class AdminControlRestaurantesController extends Controller
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

        // Verificar si el usuario tiene el rol de administrador y gestor
        if (!isset($userRoles['administrador']) && !isset($userRoles['propietario']) && !isset($userRoles['gestor'])) {
            return $this->goHome();
        }

        return parent::beforeAction($action);
    }

    /**
     * Lists all ControlRestaurantes models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ControlRestaurantesSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ControlRestaurantes model.
     * @param int $id_usuario Id Usuario
     * @param int $id_restaurante Id Restaurante
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_usuario, $id_restaurante)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_usuario, $id_restaurante),
        ]);
    }

    /**
     * Creates a new ControlRestaurantes model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new ControlRestaurantes();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_usuario' => $model->id_usuario, 'id_restaurante' => $model->id_restaurante]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing ControlRestaurantes model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_usuario Id Usuario
     * @param int $id_restaurante Id Restaurante
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_usuario, $id_restaurante)
    {
        $model = $this->findModel($id_usuario, $id_restaurante);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_usuario' => $model->id_usuario, 'id_restaurante' => $model->id_restaurante]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing ControlRestaurantes model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_usuario Id Usuario
     * @param int $id_restaurante Id Restaurante
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_usuario, $id_restaurante)
    {
        $this->findModel($id_usuario, $id_restaurante)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ControlRestaurantes model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_usuario Id Usuario
     * @param int $id_restaurante Id Restaurante
     * @return ControlRestaurantes the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_usuario, $id_restaurante)
    {
        if (($model = ControlRestaurantes::findOne(['id_usuario' => $id_usuario, 'id_restaurante' => $id_restaurante])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
