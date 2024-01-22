<?php

use yii\helpers\Html;

$this->title = 'Listar Roles';
$this->params['breadcrumbs'][] = $this->title;
?>

<h1><?= Html::encode($this->title) ?></h1>

<ul>
    <?php foreach ($roles as $role): ?>
        <li><?= Html::encode($role->name) ?></li>
    <?php endforeach; ?>
</ul>

