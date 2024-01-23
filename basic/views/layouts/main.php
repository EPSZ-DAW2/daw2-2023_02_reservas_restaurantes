<?php

/*
Pendiente:
    - Cambiar el controlador de los enlaces de la barra de navegación "site" a los utilizados
    - Darle mejor estilo al pie de página
    - Asegurarse de que el nombre de los roles coincida con el del sistema de roles utilizado
*/

/** @var yii\web\View $this */
/** @var string $content */

use app\assets\AppAsset;
use app\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;
use app\models\Usuario;

use yii\helpers\Url;

AppAsset::register($this);

$this->registerCsrfMetaTags();
$this->registerMetaTag(['charset' => Yii::$app->charset], 'charset');
$this->registerMetaTag(['name' => 'viewport', 'content' => 'width=device-width, initial-scale=1, shrink-to-fit=no']);
$this->registerMetaTag(['name' => 'description', 'content' => $this->params['meta_description'] ?? '']);
$this->registerMetaTag(['name' => 'keywords', 'content' => $this->params['meta_keywords'] ?? '']);
$this->registerLinkTag(['rel' => 'icon', 'type' => 'image/x-icon', 'href' => Yii::getAlias('@web/favicon.ico')]);

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">

<head>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>

<body class="d-flex flex-column h-100">
    <?php $this->beginBody() ?>

    <header id="header">
        <?php
        NavBar::begin([
            'brandLabel' => Yii::$app->name,
            'brandUrl' => Yii::$app->homeUrl,
            'options' => ['class' => 'navbar-expand-md navbar-dark bg-dark fixed-top py-1']
        ]);

        //Se preparan los items a mostrar en el widget Nav dependiendo del rol de usuario

        //Items siempre en vista: Inicio, Búsqueda
        $items = [
                ['label' => 'Inicio', 'url' => ['/site/index']],
                ['label' => 'Búsqueda', 'url' => ['/site/busqueda-filtrada']]
        ];

        $items2 = []; //Items para perfil

        //Items para invitado
		if (Yii::$app->user->isGuest) {
            $items2[] = ['label' => 'Login', 'url' => ['/site/login']]; //Login
            $items2[] = ['label' => 'Registro', 'url' => ['/site/registro']]; //Registro
        }else{
			// Obtener los roles del usuario actual
			$userRoles = Yii::$app->authManager->getRolesByUser(Yii::$app->user->id);

			// Verificar si el usuario tiene el rol de administrador
			if (isset($userRoles['administrador']) || isset($userRoles['moderador'])) {
                $itemsGestion = [];
                if(isset($userRoles['moderador']) && !isset($userRoles['administrador'])){
                    //Si es moderador, solo puede acceder a Restaurantes, Reseñas/Respuestas, Clientes, Incidencias
                    $itemsGestion[] = ['label' => 'Clientes', 'url' => ['/admin-clientes']];
                    $itemsGestion[] = ['label' => 'Incidencias', 'url' => ['/admin-incidencias']];
                    $itemsGestion[] = ['label' => 'Reseñas/Respuestas', 'url' => ['/admin-resenas']];
                    $itemsGestion[] = ['label' => 'Restaurantes', 'url' => ['/admin-restaurantes']];

                }else if(isset($userRoles['administrador'])){
                    //Si es administrador, puede acceder a todo
                    $itemsGestion[] = ['label' => 'Backups', 'url' => ['/admin-backups']];
                    $itemsGestion[] = ['label' => 'Categorías', 'url' => ['/admin-categorias']];
                    $itemsGestion[] = ['label' => 'Clientes', 'url' => ['/admin-clientes']];
                    $itemsGestion[] = ['label' => 'Configuraciones', 'url' => ['/admin-configuracion']];
                    $itemsGestion[] = ['label' => 'FAQ', 'url' => ['/admin-faq']];
                    $itemsGestion[] = ['label' => 'Incidencias', 'url' => ['/admin-incidencias']];
                    $itemsGestion[] = ['label' => 'Imágenes', 'url' => ['/admin-imagenes']];
                    $itemsGestion[] = ['label' => 'Reseñas/Respuestas', 'url' => ['/admin-resenas']];
                    $itemsGestion[] = ['label' => 'Reservas', 'url' => ['/admin-reservas']];
                    $itemsGestion[] = ['label' => 'Restaurantes', 'url' => ['/admin-restaurantes']];
                    $itemsGestion[] = ['label' => 'Usuarios', 'url' => ['/usuarios']];
					$itemsGestion[] = ['label' => 'Logs', 'url' => ['/logs']];
                }

                //se agregan los items de gestión al nav
				$items[] = [
                    'label' => 'Gestión', 
                    'items' => $itemsGestion
                ];
			}

			// Verificar si el usuario tiene el rol de gestor
			if (isset($userRoles['gestor']) || isset($userRoles['propietario'])) {
				$items[] = ['label' => 'Mis Restaurantes', 'url' => ['/mis-restaurantes']]; //Mis restaurantes (para propietarios y gestores)
			}

            //area personal (Dropdown)
            $nombreUsuario = Yii::$app->user->identity->nombre_usuario;
            $usuario = Usuario::findOne(['nombre_usuario' => $nombreUsuario]);
            $fotoUsuario = $usuario->getFotoUsuario();
            $items3 = [];
            $items3[] = ['label' => 'Mi Cuenta (' . Yii::$app->user->identity->nombre_usuario . ')', 'url' => ['site']];
            if(isset($userRoles['cliente'])){
                $items3[] = ['label' => 'Mi Perfil de Cliente (' . Yii::$app->user->identity->nombre_usuario . ')', 'url' => ['/reservas/mostrar-reservas-usuario']];
            }
            $items3[] = ['label' => 'Logout', 'url' => ['/site/deslogin']];
            $items2[] = [
                'label' => Html::img($fotoUsuario, ['class' => 'img-fluid rounded-circle', 'alt' => 'Perfil', 'style' => 'width: 25px; height: 25px;']),
                'items' => $items3,
                'linkOptions' => ['class' => 'nav-link'],
                'encode' => false,
                'dropdownOptions' => ['class' => 'dropdown-menu dropdown-menu-end'], //prevenir que salga de la página
            ];
		}
        
        //Se muestra el widget Nav con los items correspondientes en el centro
        echo Nav::widget([
            'options' => ['class' => 'navbar-nav mx-auto'],
            'items' => $items
        ]);
        //Otro Nav alineado a la derecha para las opciones del perfil
        echo Nav::widget([
            'options' => ['class' => 'navbar-nav ms-auto'],
            'items' => $items2
        ]);
        NavBar::end();
        ?>
    </header>

    <main id="main" class="flex-shrink-0" role="main">
        <div class="container">
            <?php //breadcrumbs: "Breadcrumbs displays a list of links indicating the position of the current page in the whole site hierarchy."
            if (!empty($this->params['breadcrumbs'])){
            ?>
                <?= Breadcrumbs::widget([
                    'homeLink' => [
                        'label' => 'Inicio',
                        'url' => Yii::$app->homeUrl,
                    ],
                    'links' => $this->params['breadcrumbs']
                    ]) ?>
            <?php } ?>
            <!-- Se muestran alertas y el contenido (vistas renderizadas) -->
            <?= Alert::widget() ?>
            <?= $content ?>
        </div>
    </main>

    <!-- pie de página -->
    <div class="container">
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <p class="col-md-4 mb-0 text-muted">&copy; La Cuchara <?= date('Y') ?></p>

        <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-md-4 justify-content-end">
        <li class="nav-item"><a href="<?= Url::to(['/site/faq']) ?>" class="nav-link px-2 text-muted">FAQ</a></li>
        <li class="nav-item"><a href="<?= Url::to(['/site/contacto']) ?>" class="nav-link px-2 text-muted">Contacto</a></li>
        </ul>
    </footer>
    </div>

    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>
