<?php

namespace app\controllers;

use app\models\Incidencias;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * IncidenciasController implements the CRUD actions for Incidencias model.
 */
class IncidenciasController extends Controller
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
                'access' => [
                    'class' => \yii\filters\AccessControl::class,
                    'rules' => [
                        [
                            // Solo usuarios autenticados pueden crear incidencias
                            'actions' => ['create'],
                            'allow' => true,
                            'roles' => ['@'], 
                        ],
                        [
                            // Accesible solo para usuarios con el rol de administrador o moderador
                            'actions' => ['index', 'view', 'update', 'delete', 'create'],
                            'allow' => true,
                            'roles' => ['administrador', 'moderador'],
                        ],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Incidencias models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Incidencias::find(),
            /*
            'pagination' => [
                'pageSize' => 50
            ],
            'sort' => [
                'defaultOrder' => [
                    'id_incidencia' => SORT_DESC,
                ]
            ],
            */
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Incidencias model.
     * @param int $id_incidencia Id Incidencia
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_incidencia)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_incidencia),
        ]);
    }

    /**
     * Creates a new Incidencias model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Incidencias();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_incidencia' => $model->id_incidencia]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Incidencias model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_incidencia Id Incidencia
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_incidencia)
    {
        $model = $this->findModel($id_incidencia);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_incidencia' => $model->id_incidencia]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Incidencias model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_incidencia Id Incidencia
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_incidencia)
    {
        $this->findModel($id_incidencia)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Incidencias model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_incidencia Id Incidencia
     * @return Incidencias the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_incidencia)
    {
        if (($model = Incidencias::findOne(['id_incidencia' => $id_incidencia])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
