<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\RegistroForm;
use app\models\ContactForm;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }


    /*
        ACCIÓN DE REGISTRO DE UN CLIENTE NORMAL
    */
    public function actionRegistro()
    {
        // si el usuario ya ha iniciado sesión y accede aqui
        if (Yii::$app->session->get('isUserLoggedIn')) {
            return $this->goHome(); // redirigimos a la pagina inicial
        }

        // creamos el modelo de registro
        $model = new RegistroForm();
        // cargamos los datos del formulario de registro si los hay y si se cumple la validacion del registro
        if ($model->load(Yii::$app->request->post()) && $model->registro()) { 
            return $this->goBack(); // redirigimos a la página anterior
        }

        // seguridad
        $model->password = '';

        // si no, volvemos a la vista registro con los datos del modelo
        return $this->render('registro', [
            'model' => $model,
        ]);
    }


    /*
        ACCIÓN DE REGISTRO DE UN GESTOR O PROPIETARIO
    */
    public function actionRegistrogp()
    {
        // si el usuario ya ha iniciado sesión y accede aqui
        if (Yii::$app->session->get('isUserLoggedIn')) {
            return $this->goHome(); // redirigimos a la pagina inicial
        }

        // creamos el modelo de registro
        $model = new RegistroForm();
        // cargamos los datos del formulario de registro si los hay y si se cumple la validacion del registro
        if ($model->load(Yii::$app->request->post()) && $model->registro()) { 
            return $this->goBack(); // redirigimos a la página anterior
        }

        // seguridad
        $model->password = '';

        // si no, volvemos a la vista registro con los datos del modelo
        return $this->render('registrogp', [
            'model' => $model,
        ]);
    }


    /*
        ACCIÓN DE LOGIN
    */
    public function actionLogin()
    {
        //si el usuario ya ha iniciado sesión y accede aqui
        if (Yii::$app->session->get('isUserLoggedIn')) {
            return $this->goHome(); // redirigimos a la pagina inicial
        }

        // creamos el modelo de login
        $model = new LoginForm();
        // cargamos los datos del formulario de registro si los hay y si se cumple la validacion del registro
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack(); // redirigimos a la página anterior
        }

        // seguridad
        $model->password = '';

        // si no, volvemos a la vista login con los datos del modelo
        return $this->render('login', [
            'model' => $model,
        ]);
    }



    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionDeslogin()
    {
        Yii::$app->session->destroy();

        return $this->goHome();
    }

    

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }


}
