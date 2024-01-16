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
            'options' => ['class' => 'navbar-expand-md navbar-dark bg-dark fixed-top']
        ]);

        //Se preparan los items a mostrar en el widget Nav dependiendo del rol de usuario
        $items = [
            ['label' => 'Inicio', 'url' => ['/site/index']],
            ['label' => 'Explorar', 'url' => ['/site/explorar']],
        ];
        if (Yii::$app->user->isGuest) {
            //Si el usuario es invitado se muestra login
            $items[] = ['label' => 'Login', 'url' => ['/site/login']];
        } else {
            //Si el usuario no es invitado se muestra logout y perfil
            $items[] = '<li class="nav-item">'
                . Html::beginForm(['/site/logout'])
                . Html::submitButton(
                    'Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
                    ['class' => 'nav-link btn btn-link logout']
                )
                . Html::endForm()
                . '</li>';
            $items[] = ['label' => 'Mi Perfil', 'url' => ['/site/profile']];
            //Si el usuario es propietario o gestor se muestra "Mis Restaurantes"
            if (true)
                $items[] = ['label' => 'Mis Restaurantes', 'url' => ['/site/myrestaurants']];
            //Si el usuario es admin se muestra "Vista de Administrador
            if (true)
                $items[] = ['label' => 'Vista de Administrador', 'url' => ['/site/adminview']];
            //Si el usuario es moderador se muestra "Vista de moderador"
            if (true)
                $items[] = ['label' => 'Vista de Moderador', 'url' => ['/site/moderatorview']];
        }
        //Se muestra el widget Nav con los items correspondientes
        echo Nav::widget([
            'options' => ['class' => 'navbar-nav'],
            'items' => $items
        ]);
        NavBar::end();
        ?>
    </header>

    <main id="main" class="flex-shrink-0" role="main">
        <div class="container">
            <?php //breadcrumbs: "Breadcrumbs displays a list of links indicating the position of the current page in the whole site hierarchy."
            if (!empty($this->params['breadcrumbs'])) :
            ?>
                <?= Breadcrumbs::widget(['links' => $this->params['breadcrumbs']]) ?>
            <?php endif ?>
            <!-- Se muestran alertas y el contenido (vistas renderizadas) -->
            <?= Alert::widget() ?>
            <?= $content ?>
        </div>
    </main>

    <!-- Pie de página con información relevante -->
    <footer id="footer" class="mt-auto py-3 bg-light">
        <div class="container">
            <div class="row text-muted">
                <div class="col-md-6 text-center text-md-start">&copy; La Cuchara <?= date('Y') ?></div>
                <div class="col-md-6 text-center text-md-end"><?= Yii::powered() ?></div>
                <div class="col-md-6 text-center text-md-end">
                    <ul class="list-unstyled">
                        <li><a class="text-muted" href="<?= Url::to(['/site/faq']) ?>">FAQ</a></li>
                        <li><a class="text-muted" href="<?= Url::to(['/site/contacto']) ?>">Contacto</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>