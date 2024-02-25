<?php

namespace app\controllers;

use app\models\UsuariosMantenimiento;
use app\models\BuscarUsuario;
use yii\data\ActiveDataProvider;
use app\models\Resena;
use yii\web\Controller;
use app\models\Imagen;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use Yii;


/**
 * UsuariosController implements the CRUD actions for UsuariosMantenimiento model.
 */
class UsuariosController extends Controller
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
	
    public function beforeAction($action)
    {
        // Verificar si el usuario tiene el rol de moderador
        $userRoles = Yii::$app->authManager->getRolesByUser(Yii::$app->user->id);

        if (!isset($userRoles['administrador']) && !isset($userRoles['moderador']) && isset($userRoles['cliente'])) {
            Yii::$app->session->setFlash('error', 'No tienes permiso para acceder a esta página.');
            return $this->goHome();
        }
    
        if (isset($userRoles['moderador'])) {
            // Acciones permitidas para moderadores
            $allowedActions = ['view', 'update', 'index']; // Acciones específicas permitidas para moderadores
    
            // Verificar si la acción actual está permitida para el moderador
            if (!in_array($action->id, $allowedActions)) {
                Yii::$app->session->setFlash('error', 'No tienes permiso para acceder a esta página.');
                return $this->redirect(Yii::$app->getRequest()->getReferrer());
            }
        }
        if (isset($userRoles['cliente'])) {
            // Acciones permitidas para clientes
            $allowedActions = ['mis-resenas']; // Acciones permitidas para clientes
    
            // Verificar si la acción actual está permitida para todos los clientes
            if (!in_array($action->id, $allowedActions)) {
                Yii::$app->session->setFlash('error', 'No tienes permiso para acceder a esta página.');
                return $this->redirect(Yii::$app->getRequest()->getReferrer());
            }
        }
    
    
        return parent::beforeAction($action);
    }
    
	

    /**
     * Lists all UsuariosMantenimiento models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new BuscarUsuario();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single UsuariosMantenimiento model.
     * @param int $id_usuario Id Usuario
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_usuario)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_usuario),
        ]);
    }

    /**
     * Creates a new UsuariosMantenimiento model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new UsuariosMantenimiento();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_usuario' => $model->id_usuario]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing UsuariosMantenimiento model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_usuario Id Usuario
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */

	public function actionUpdate($id_usuario)
{
    $model = $this->findModel($id_usuario);

    if ($this->request->isPost && $model->load($this->request->post())) {
        // Asignar el valor del rol al modelo
        $model->rol = $this->request->post('UsuariosMantenimiento')['rol'];

        // Guardar el modelo
        if ($model->save()) {
            // Llamar a la acción para asignar roles
            Yii::$app->runAction('roles/asignar-roles');

            // Redireccionar a la vista
            return $this->redirect(['view', 'id_usuario' => $model->id_usuario]);
        }
    }

    return $this->render('update', [
        'model' => $model,
    ]);
}

	

    /**
     * Deletes an existing UsuariosMantenimiento model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_usuario Id Usuario
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_usuario)
    {
        // Verificar si el usuario tiene el rol de moderador
        $userRoles = Yii::$app->authManager->getRolesByUser(Yii::$app->user->id);
    
        if (!isset($userRoles['moderador'])) {
            $this->findModel($id_usuario)->delete();

            return $this->redirect(['index']);
        } else {
            return false;
        }
    }

    /**
     * Finds the UsuariosMantenimiento model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_usuario Id Usuario
     * @return UsuariosMantenimiento the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_usuario)
    {
        if (($model = UsuariosMantenimiento::findOne(['id_usuario' => $id_usuario])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
	
	//Accion para poder listar los roles del sistema
	public function actionListarRoles()
	{
    $roles = Yii::$app->authManager->getRoles();

    return $this->render('listar-roles', [
        'roles' => $roles,
    ]);
	}
	
	//Accion para poder asignar roles a UsuariosController


// En tu controlador
public function actionAsignarRol($id_usuario) {
    // Obtener la lista de usuarios
    $usuarios = UsuariosMantenimiento::find()->all();

    // Resto del código para la acción
    return $this->render('asignar-rol', [
        'usuarios' => $usuarios,
        // Otros datos que necesites pasar a la vista
    ]);
}


	//Accion para bloquear ususarios ponemos a 1 en la base de datos
	public function actionBloquearUsuario($id_usuario)
	{
    $model = $this->findModel($id_usuario);

    if ($this->request->isPost) {
        $model->bloqueado = 1; // O el valor que uses para indicar que está bloqueado
        $model->save();

        return $this->redirect(['view', 'id_usuario' => $id_usuario]);
    }

    return $this->render('bloquear-usuario', [
        'model' => $model,
    ]);
	}
	
	public function actionMisResenas()
    {
        // Obtener el ID del usuario logueado
        $userId = Yii::$app->user->identity->id;

        // Obtener las reseñas del usuario con paginación
        $dataProvider = new ActiveDataProvider([
            'query' => Resena::find()->where(['id_usuario' => $userId])->orderBy(['fecha_resena' => SORT_DESC]),
            'pagination' => [
                'pageSize' => 10, // Ajusta el tamaño de la página según tus necesidades
            ],
        ]);

        return $this->render('misResenas', [
            'dataProvider' => $dataProvider,
        ]);
    }
	
public function actionMisFavoritos()
{
    // ...
    return $this->render('mis-favoritos', [
        'dataProvider' => $dataProvider,
    ]);
}




}
