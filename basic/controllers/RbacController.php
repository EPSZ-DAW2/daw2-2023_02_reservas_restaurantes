<?php


namespace app\controllers; 

use yii\console\Controller;
use yii\rbac\DbManager;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = new DbManager;

        // Define y crea el rol "administrador"
        $adminRole = $auth->createRole('administrador');
        $adminRole->description = 'Rol de administrador con permisos completos';
        $auth->add($adminRole);

        // Define y crea el rol "moderador"
        $moderatorRole = $auth->createRole('moderador');
        $moderatorRole->description = 'Rol de moderador con permisos de moderación';
        $auth->add($moderatorRole);

        // Define y crea el rol "gestor"
        $managerRole = $auth->createRole('gestor');
        $managerRole->description = 'Rol de gestor con permisos de gestión';
        $auth->add($managerRole);

        echo "Roles creados exitosamente.\n";
    }
}
