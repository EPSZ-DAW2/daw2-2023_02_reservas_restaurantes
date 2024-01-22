<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;

class RolesController extends Controller
{
    public function actionAsignarRoles()
{
    // Lógica para obtener información del usuario y el nombre del rol
    $usuarios = Yii::$app->db->createCommand('SELECT id_usuario, rol FROM usuarios')->queryAll();

    // Obtén el componente authManager
    $authManager = Yii::$app->authManager;

    foreach ($usuarios as $usuario) {
        $userId = $usuario['id_usuario'];
        $nombreRol = $usuario['rol'];

        // Obtener todos los roles actuales del usuario
        $rolesActuales = $authManager->getRolesByUser($userId);

        // Revocar todos los roles actuales del usuario
        foreach ($rolesActuales as $rolActual) {
            $authManager->revoke($rolActual, $userId);
        }

        // Asignar el nuevo rol al usuario
        $role = $authManager->getRole($nombreRol);

        if ($role !== null) {
            $authManager->assign($role, $userId);
            
        } else {
            Yii::$app->session->setFlash('error', "No se encontró el rol '$nombreRol' para el usuario con ID $userId.");
        }
    }

    // Puedes redirigir a otra página después de asignar los roles si es necesario
    return $this->redirect(['site/index']);
}

}
