<?php

namespace app\controllers;

use app\models\logs;
use app\models\logsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Html;
use Yii;

/**
 * LogsController implements the CRUD actions for logs model.
 */
class LogsController extends Controller
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
        $userRoles = Yii::$app->authManager->getRolesByUser(Yii::$app->user->id);

        // Verificar si el usuario tiene el rol de administrador
        if (!isset($userRoles['administrador'])) {
            return $this->goHome();
        }

        return parent::beforeAction($action);
    }

    /**
     * Lists all logs models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new logsSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single logs model.
     * @param int $id_log Id Log
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_log)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_log),
        ]);
    }

    /**
     * Creates a new logs model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new logs();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_log' => $model->id_log]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing logs model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_log Id Log
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_log)
    {
        $model = $this->findModel($id_log);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_log' => $model->id_log]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing logs model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_log Id Log
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_log)
    {
        $this->findModel($id_log)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the logs model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_log Id Log
     * @return logs the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_log)
    {
        if (($model = logs::findOne(['id_log' => $id_log])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
	
	public function actionExport()
{
    // Obtener todos los registros de log
    $logs = logs::find()->all();

    // Crear el contenido del archivo de texto
    $content = "ID\tTipo\tTexto\tFecha/Hora\n";
    foreach ($logs as $log) {
        $content .= "{$log->id_log}\t{$log->tipo_log}\t{$log->texto_log}\t{$log->fecha_hora}\n";
    }

    // Definir la respuesta como un archivo de texto
    \Yii::$app->response->headers->set('Content-Type', 'text/plain');
    \Yii::$app->response->headers->set('Content-Disposition', 'attachment; filename=logs.txt');

    // Enviar el contenido del archivo al navegador
    \Yii::$app->response->content = $content;

    return \Yii::$app->response->send();
}
public function actionDeleteOldLogs()
{
    // Fecha actual
    $currentDate = date('Y-m-d H:i:s');

    // Fecha hace un año
    $oneYearAgo = date('Y-m-d H:i:s', strtotime('-1 year', strtotime($currentDate)));

    // Eliminar registros antiguos
    logs::deleteAll(['<', 'fecha_hora', $oneYearAgo]);

    // Redirigir a la página de índice
    return $this->redirect(['index']);
}

public function actionMostrarLogs()
{
    // Obtener la ruta al archivo de logs
    $logFile = Yii::getAlias(Yii::$app->getLog()->targets[0]->logFile);

    // Verificar si el archivo de logs existe
    if (file_exists($logFile)) {
        // Obtener el contenido del archivo de logs
        $logContent = file_get_contents($logFile);

        // Mostrar los logs por pantalla
        echo '<pre>' . Html::encode($logContent) . '</pre>';
    } else {
        echo 'No hay registros de logs disponibles.';
    }
}








}
