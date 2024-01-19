<?php


namespace app\controllers; 

use yii\console\Controller;
use yii\rbac\DbManager;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = new DbManager;


		
				// Define y crea el rol "cliente"
        $managerRole = $auth->createRole('cliente');
        $managerRole->description = 'Rol de cliente con permisos de gestión';
        $auth->add($managerRole);

        echo "Roles creados exitosamente.\n";
    }
}
