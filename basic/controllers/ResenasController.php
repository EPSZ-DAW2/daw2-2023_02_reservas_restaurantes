<?php

namespace app\controllers;
use app\models\Resena;
use app\models\Respuestas;
use Yii;

class ResenasController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }


    //public function actionView($id)
    //{
    //    $model = Resena::findOne($id);
//
    //    if ($model === null) {
    //        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    //    }
//
    //    return $this->render('view', [
    //        'model' => $model,
    //    ]);
    //}

    protected function findModel($id)
    {
        if (($model = Resena::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionView($id)
    {
        $model = $this->findModel($id);
        $respuestas = Respuestas::find()->where(['id_respuesta_padre' => $id])->all();
        return $this->render('view', [
            'model' => $model,
            'respuestas' => $respuestas,
        ]);
    }
}