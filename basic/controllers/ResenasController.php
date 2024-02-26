<?php

namespace app\controllers;
use app\models\Resena;
use Yii;

class ResenasController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }


    public function actionView($id)
    {
        $model = Resena::findOne($id);

        if ($model === null) {
            throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
        }

        return $this->render('view', [
            'model' => $model,
        ]);
    }
}