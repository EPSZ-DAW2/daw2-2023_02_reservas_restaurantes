<?php

namespace app\controllers;

use app\models\Categoria;
use app\models\CategoriaRestaurante;
use app\models\CategoriaSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

use Yii;
use app\models\Configuracion;

/**
 * AdminCategoriasController implements the CRUD actions for Categoria model.
 */
class AdminCategoriasController extends Controller
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
     * Lists all Categoria models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new CategoriaSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination->pageSize = Configuracion::findByNombreVariable('numElemsCAT') ? Configuracion::findByNombreVariable('numElemsCAT') : 10;

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Categoria model.
     * @param int $id_categoria Id Categoria
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_categoria)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_categoria),
        ]);
    }

    /**
     * Creates a new Categoria model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Categoria();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_categoria' => $model->id_categoria]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Categoria model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_categoria Id Categoria
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_categoria)
    {
        $model = $this->findModel($id_categoria);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_categoria' => $model->id_categoria]);
        }

        return $this->render('update', [
            'model' => $model
        ]);
    }

    //Función para agregar un restaurante desde el formulario en la vista de update
    public function actionAgregarRestaurante()
    {
        $categoriaRestauranteModel = new CategoriaRestaurante();
    
        if ($categoriaRestauranteModel->load(Yii::$app->request->post())) {
            if ($categoriaRestauranteModel->save()) {
                return $this->redirect(['view', 'id_categoria' => $categoriaRestauranteModel->id_categoria]);
            }
        }
    
        return $this->render('update', [
            'model' => Categoria::find($categoriaRestauranteModel->id_categoria)->one(),
        ]);
    }

    //Función para eliminar un restaurante de la categoría desde view
    public function actionEliminarRestaurante($id_categoria, $id_restaurante)
    {
        $categoriaRestauranteModel = CategoriaRestaurante::find()->where(['id_categoria' => $id_categoria, 'id_restaurante' => $id_restaurante])->one();
        $categoriaRestauranteModel->delete();

        return $this->redirect(['view', 'id_categoria' => $id_categoria]);
    }


    /**
     * Deletes an existing Categoria model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_categoria Id Categoria
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_categoria)
    {
        $this->findModel($id_categoria)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Categoria model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_categoria Id Categoria
     * @return Categoria the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_categoria)
    {
        if (($model = Categoria::findOne(['id_categoria' => $id_categoria])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

}
