<?php
// app\controllers\FavoritosController.php

namespace app\controllers;

use Yii;
use app\models\Favoritos;
use yii\web\Controller;

class FavoritosController extends Controller
{
    public function actionAgregarFavorito($id_restaurante)
    {
        $favorito = new Favoritos();
        $favorito->id_usuario = Yii::$app->user->identity->id; // ID del usuario logueado
        $favorito->id_restaurante = $id_restaurante;

        if ($favorito->save()) {
            Yii::$app->session->setFlash('success', 'Restaurante agregado a favoritos correctamente.');
        } else {
            Yii::$app->session->setFlash('error', 'Error al agregar a favoritos.');
        }

        return $this->redirect(['index']); // Redirige a la página de favoritos
    }

    public function actionEliminarFavorito($id_restaurante)
    {
        $usuarioId = Yii::$app->user->identity->id;

        $favorito = Favoritos::findOne(['id_usuario' => $usuarioId, 'id_restaurante' => $id_restaurante]);

        if ($favorito && $favorito->delete()) {
            Yii::$app->session->setFlash('success', 'Restaurante eliminado de favoritos correctamente.');
        } else {
            Yii::$app->session->setFlash('error', 'Error al eliminar de favoritos.');
        }

        return $this->redirect(['index']); // Redirige a la página de favoritos
    }

    public function actionMisFavoritos()
    {
        $usuarioId = Yii::$app->user->identity->id;

        $dataProvider = new \yii\data\ActiveDataProvider([
            'query' => Favoritos::find()->where(['id_usuario' => $usuarioId]),
            'pagination' => [
                'pageSize' => 10, // Ajusta el tamaño de la página según tus necesidades
            ],
        ]);

        return $this->render('mis-favoritos', [
            'dataProvider' => $dataProvider,
        ]);
    }
}
