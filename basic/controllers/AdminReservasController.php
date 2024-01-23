<?php

namespace app\controllers;

use app\models\Reserva;
use app\models\ReservaSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use Yii;

/**
 * ReservasController implements the CRUD actions for Reserva model.
 */
class AdminReservasController extends Controller
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
     * Lists all Reserva models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ReservaSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Reserva model.
     * @param int $id_reserva Identificador de cada reserva.
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_reserva)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_reserva),
        ]);
    }

    /**
     * Creates a new Reserva model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Reserva();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_reserva' => $model->id_reserva]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Reserva model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_reserva Identificador de cada reserva.
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
public function actionUpdate($id_reserva)
{
    $model = $this->findModel($id_reserva);

    // Verificar si el usuario tiene el rol de "administrador"
    $userRoles = Yii::$app->authManager->getRolesByUser(Yii::$app->user->id);

    if (isset($userRoles['administrador'])) {
        // Si es administrador, mostrar la vista 'update'
        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->validate()) {
                // Validar el modelo y, si es válido, realizar la actualización
                $model->save();
                return $this->redirect(['view', 'id_reserva' => $model->id_reserva]);
            }
        }
        return $this->render('update', [
            'model' => $model,
        ]);
    } else {
        // Si no es administrador, mostrar la vista 'updateClientes'
        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->validate()) {
                // Validar el modelo y, si es válido, realizar la actualización
                $model->save();
                return $this->redirect(['view', 'id_reserva' => $model->id_reserva]);
            }
        }
        return $this->render('updateClientes', [
            'model' => $model,
        ]);
    }
}






	




    /**
     * Deletes an existing Reserva model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_reserva Identificador de cada reserva.
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_reserva)
    {
        $this->findModel($id_reserva)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Reserva model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_reserva Identificador de cada reserva.
     * @return Reserva the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_reserva)
    {
        if (($model = Reserva::findOne(['id_reserva' => $id_reserva])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

	
	  // Acción para mostrar las reservas del usuario logueado
// ...
public function actionMostrarReservasUsuarioHistorial()
{
    // Obtener el ID del usuario logueado
    $userId = Yii::$app->user->identity->id;

    // Obtener todas las reservas del usuario sin importar el rol
    $reservas = Reserva::find()
        ->with('restaurante') // Cargar la relación con el restaurante
        ->where(['id_usuario' => $userId])
        ->all();

    // Luego, pasas las reservas a tu vista o realizas las acciones necesarias
    return $this->render('mostrarReservasUsuarioHistorial', [
        'reservas' => $reservas,
    ]);
}



	public function actionMostrarReservasUsuario()
{
    // Obtener el ID del usuario logueado
    $userId = Yii::$app->user->identity->id;

    // Obtener todas las reservas del usuario sin importar el rol
    // Obtener la fecha actual
    $fechaActual = date('Y-m-d');

    // Filtrar las reservas por el ID del usuario y por la fecha activa
    $reservas = Reserva::find()
        ->with('restaurante') // Cargar la relación con el restaurante
        ->where(['id_usuario' => $userId])
        ->andWhere(['>=', 'fecha_reserva', $fechaActual])
        ->all();

    // Luego, pasas las reservas a tu vista o realizas las acciones necesarias
    return $this->render('mostrarReservasUsuario', [
        'reservas' => $reservas,
    ]);
}







}
