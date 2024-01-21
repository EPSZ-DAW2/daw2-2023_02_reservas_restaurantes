<?php
use yii\helpers\Html;
use yii\helpers\Url; // Importa la clase Url

$this->title = 'Login Blocked';

$homeUrl = Url::home(true);

$this->registerJs(<<<JS
    var tiempoRestante = $tiempo;
    var intervalo = setInterval(function() {
        tiempoRestante -= 1;
        if (tiempoRestante <= 0) {
            clearInterval(intervalo);
            window.location.href = '$homeUrl?removeBlockedSession=true';
        }
        document.getElementById('tiempo-restante').innerText = tiempoRestante;
    }, 1000);

    // Bloquear la pantalla
    overlay.style.display = 'block';
    overlay.style.width = window.innerWidth + 'px';
    overlay.style.height = window.innerHeight + 'px';
    overlay.style.position = 'fixed';
    overlay.style.top = '0';
    overlay.style.left = '0';
    overlay.style.background = 'rgba(0, 0, 0, 0.5)';
    overlay.style.zIndex = '9999';
JS
, \yii\web\View::POS_END);
?>


<div class="container my-5">
    <div class="site-login-blocked alert alert-danger d-flex align-items-center justify-content-center">
        <div class="text-center">
            <h1><?= Html::encode($this->title) ?></h1>
            <p class="mt-5">Sesión bloqueada. Intenta nuevamente más tarde.</p>
            <p>Tiempo restante: <span id="tiempo-restante"><?= $tiempo ?></span> segundos</p>
        </div>
    </div>
</div>

<div id="overlay" style="display: none;"></div>