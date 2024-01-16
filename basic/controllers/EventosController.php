<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Evento;
use yii\data\ActiveDataProvider;
//use yii\filters\AccessControl;

class EventosController extends Controller
{
    // Configuración de acceso
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'view', 'create', 'update', 'delete'],
                        'allow' => true,
                        'roles' => ['@'], // Requiere que el usuario esté autenticado
                    ],
                ],
            ],
        ];
    }


	//--------------------
		public function actionIndex()
	{
    $dataProvider = new ActiveDataProvider([
        'query' => Evento::find(),
        'pagination' => [
            'pageSize' => 10, // Puedes ajustar la cantidad de eventos por página según tus necesidades.
        ],
    ]);

    return $this->render('index', [
        'dataProvider' => $dataProvider,
    ]);
	}
	//-------------------

    // Acción para ver un evento específico
    public function actionView($id)
    {
        $evento = Evento::findOne($id);
        return $this->render('view', ['evento' => $evento]);
    }

    // Acción para crear un nuevo evento

	// En EventosController.php
public function actionCreate()
{
    $evento = new Evento();

    if ($evento->load(Yii::$app->request->post()) && $evento->save()) {
        return $this->redirect(['view', 'id' => $evento->id_evento]);
    }

    // Agregar el siguiente código para imprimir los errores del modelo
    if ($evento->hasErrors()) {
        Yii::error($evento->errors);
    }

    return $this->render('crear', ['evento' => $evento]);
}



    // Acción para actualizar un evento existente
    public function actionUpdate($id)
    {
        $evento = Evento::findOne($id);

        if ($evento->load(Yii::$app->request->post()) && $evento->save()) {
            return $this->redirect(['view', 'id' => $evento->id]);
        }

        return $this->render('update', ['evento' => $evento]);
    }

    // Acción para eliminar un evento existente
    public function actionDelete($id)
    {
        $evento = Evento::findOne($id);
        $evento->delete();

        return $this->redirect(['index']);
    }

}


