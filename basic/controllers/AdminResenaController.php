<?php

namespace app\controllers;

use app\models\resena;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ResenaController implements the CRUD actions for resena model.
 */
class AdminResenaController extends Controller
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
     * Lists all resena models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => resena::find(),
            /*
            'pagination' => [
                'pageSize' => 50
            ],
            'sort' => [
                'defaultOrder' => [
                    'id_resena' => SORT_DESC,
                ]
            ],
            */
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single resena model.
     * @param int $id_resena Id Resena
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_resena)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_resena),
        ]);
    }

    /**
     * Creates a new resena model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new resena();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_resena' => $model->id_resena]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing resena model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_resena Id Resena
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_resena)
    {
        $model = $this->findModel($id_resena);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_resena' => $model->id_resena]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing resena model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_resena Id Resena
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_resena)
    {
        $this->findModel($id_resena)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the resena model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_resena Id Resena
     * @return resena the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_resena)
    {
        if (($model = resena::findOne(['id_resena' => $id_resena])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
