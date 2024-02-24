<?php

namespace app\controllers;

use app\models\BuscarUsuario;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\RegistroForm;
use app\models\LoginForm;
use app\models\BusquedaFiltrada;
use app\models\TipoComida;
use app\models\Restaurante;
use app\models\ContactForm;
use app\models\Categoria;
use app\models\Configuracion;
use yii\data\ActiveDataProvider;
use app\models\RespuestasFaqSearch;

use app\models\Imagen;

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
    public function actionIndex($numCategorias = NULL)
    {

        if($numCategorias == NULL)
        {
            $numCategorias = Configuracion::findByNombreVariable('minCarruselesPortada') ? Configuracion::findByNombreVariable('minCarruselesPortada') : 2;
        }
        // si venimos redirigidos del bloqueo de sesion
        if (Yii::$app->request->get('removeBlockedSession')) {
            Yii::$app->session->remove('loginBlockedUntil');
        }    

        //Se obtiene el id de la última categoría en la bbdd
        $maxCategoria = Categoria::find()->max('id_categoria');
        //Se obtiene la imagen del propietario
        $imagenPropietario = Imagen::find()->where(['id_imagen' => 71])->one();
        return $this->render('index', [
            'maxCategoria' => $maxCategoria,
            'numCategorias' => $numCategorias,
            'imagenPropietario' => $imagenPropietario
        ]);
    }


    
    /*
        ACCIÓN DE REGISTRO DE UN USUARIO
    */
    public function actionRegistro()
    {
        // si el usuario ya ha iniciado sesión y accede aqui
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        // creamos el modelo de registro
        $model = new RegistroForm();
        // cargamos los datos del formulario de registro si los hay y si se cumple la validacion del registro
        if ($model->load(Yii::$app->request->post()) && $model->registro()) { 
            return $this->goBack();
        }

        // si no, volvemos a la vista registro con los datos del modelo
        return $this->render('registro', [
            'model' => $model,
        ]);
    }


    /*
        ACCIÓN DE LOGIN
    */
    public function actionLogin()
    {

        // Verificar si la sesión está bloqueada
        if (Yii::$app->session->get('loginBlockedUntil')) {
            $lockTime = Yii::$app->session->get('loginBlockedUntil');
            return $this->render('loginBlocked', [
                'tiempo' => $lockTime,
            ]);
        }

        // si el usuario ya ha iniciado sesión y accede aqui
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        // creamos el modelo de login
        $model = new LoginForm();
        // cargamos los datos del formulario de registro si los hay y si se cumple la validacion del registro
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack(); // redirigimos a la página anterior
        }

        // si no, volvemos a la vista login con los datos del modelo
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /*
        ACCIÓN DE LOGOUT
    */
    public function actionDeslogin()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }


    /*
        ACCIÓN DE BÚSQUEDA FILTRADA
    */
    public function actionBusquedaFiltrada()
    {
        // creamos el modelo de busqueda
        $model = new BusquedaFiltrada();

        //obtenemos las categorias y tipos disponibles de restaurantes en la app
        $categoriasConSubcategorias = Categoria::obtenerCategoriasConPadre();
        $categoriasDropdown = $model->generarCategoriasDropdown($categoriasConSubcategorias);
        $tiposConSubtipos = TipoComida::obtenerTiposConPadre();
        $tiposDropdown = $model->generarTiposDropdown($tiposConSubtipos);

        //obtenemos las comunidadesautonomas, ciudades y barrios de los distintos restaurantes
        $comunidades = Restaurante::getAllComunidadesAutonomas();
        $ciudades = Restaurante::getAllCiudades();
        $barrios = Restaurante::getAllBarrios();

        //obtenemos los IDs de todos los restaurantes para el mostrado sin fltros
        $IDs = Restaurante::getAllIDs();

        $dataProvider = new ActiveDataProvider([
            'query' => Restaurante::find()->where(['id_restaurante' => $IDs]),
            'pagination' => [
                'pageSize' => Configuracion::findByNombreVariable('numElemsBusquedaFiltrada'),
            ],
        ]);


        


        // cargamos los datos del formulario de filtro si los hay
        if ($model->load(Yii::$app->request->post())) { 
            //caragmos los ids de la respuesta en caso de haberla
            $ids_restaurante = $model->busquedaFiltrada();

            //si ha ido bien la validacion de datos y ha encontrado algun restaurante con el filtro
            if($ids_restaurante != false)
            {
                $dataProvider->query->andWhere(['id_restaurante' => $ids_restaurante]);
            }
            // si no
            else
            {
                Yii::$app->session->setFlash('warning', 'No se han encontrado restaurantes que cumplan tus filtros de búsqueda. Prueba con otros.');

                return $this->render('busqueda-filtrada', [
                    'model' => $model,
                    'categoriasDropdown' => $categoriasDropdown,
                    'tiposDropdown' => $tiposDropdown,
                    'comunidades' => $comunidades,
                    'ciudades' => $ciudades,
                    'barrios' => $barrios,
                    'dataProvider' => null,
                ]);
            } 
        }



        // cargamos los datos introducidos en la barra de busqueda
        else if (Yii::$app->request->get('palabrasClave')) { 
            
            $palabrasClave = Yii::$app->request->get('palabrasClave');            

            //caragmos los ids de la respuesta en caso de haberla
            $ids_restaurante = $model->busquedaBarra($palabrasClave);

            //si ha encontrado algun restaurante con lo dado en la busqueda
            if($ids_restaurante != false)
            {
                $dataProvider->query->andWhere(['id_restaurante' => $ids_restaurante]);
            }
            // si no
            else
            {
                Yii::$app->session->setFlash('warning', 'No se han encontrado restaurantes que cumplan tus filtros de búsqueda. Prueba con otros.');

                return $this->render('busqueda-filtrada', [
                    'model' => $model,
                    'categoriasDropdown' => $categoriasDropdown,
                    'tiposDropdown' => $tiposDropdown,
                    'comunidades' => $comunidades,
                    'ciudades' => $ciudades,
                    'barrios' => $barrios,
                    'dataProvider' => null,
                ]);
            } 
        }


        return $this->render('busqueda-filtrada', [
            'model' => $model,
            'categoriasDropdown' => $categoriasDropdown,
            'tiposDropdown' => $tiposDropdown,
            'comunidades' => $comunidades,
            'ciudades' => $ciudades,
            'barrios' => $barrios,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionFaq()
    {
        $searchModel = new RespuestasFaqSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination->pageSize = Configuracion::findByNombreVariable('numElemsFAQ') ? Configuracion::findByNombreVariable('numElemsFAQ') : 10;

        return $this->render('faq', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


     /**
      * Displays contact page.
      *
      * @return Response|string
      */
     public function actionContacto()
     {
         $model = new ContactForm();
         if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
             Yii::$app->session->setFlash('contactFormSubmitted');
             return $this->refresh();
         }
         return $this->render('contacto', [
             'model' => $model,
         ]);
     }

    // /**
    //  * Displays about page.
    //  *
    //  * @return string
    //  */
    // public function actionAbout()
    // {
    //     return $this->render('about');
    // }
}
