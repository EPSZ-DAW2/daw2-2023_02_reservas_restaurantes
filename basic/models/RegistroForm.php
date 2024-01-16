<?php

namespace app\models;

use Yii;
use yii\base\Model;

/*
    MODELO PARA EL REGISTRO DE USUARIOS EN LA APLICACIÓN
 */
class RegistroForm extends Model
{
    // datos a solicitar en el registro
    public $username;
    public $email;
    public $password;
    public $esPropietario;

    private $_user = false;

    /*
        REGLAS DE VALIDACIÓN DEL REGISTRO

        * devuelve un array con las reglas de validacion
    */
    public function rules()
    {
        return [
            // datos requeridos en el registro
            [['username', 'email', 'password'], 'required'],
            // el email tiene que ser de tipo email
            ['email', 'email'],
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
            // make 'esPropietario' safe for assignment
            ['esPropietario', 'safe'],
        ];
    }

    /*
        ACCIÓN PARA VALIDAR LA CONTRASEÑA INTRODCIDA EN EL REGISTRO
    */
    public function validatePassword($attribute, $params)
    {
        //si no hay errores en el modelo
        if (!$this->hasErrors()) {

            if (strlen($this->password) < 8) {
                $this->addError($attribute, 'La contraseña debe tener almenos 8 carcateres.');
            }
        }
    }

    /*
        REGISTRO DE LOS DATOS DADOS POR EL USAURIO

        * devuelve un booleano si se ha registrado con éxito o no
    */
    public function registro()
    {
        //comprobamos si los datos del registro cumplen las reglas
        if ($this->validate()) {
            // Comprobamos si el usuario dado ya existe
            $existingUser = $this->getUser();

            // Si el usuario ya existe, añadir un error al modelo
            if ($existingUser !== null) {
                $this->addError('username', 'Este nombre de usuario ya está en uso.');
                return false;
            }

            // Si el usuario no existe, proceder con el registro
            $resultado = $this->registrar();
            return $resultado;
        
        }
        //si no son correctos o algo falla
        return false;
    }


    /**
     * EJECUTA EL REGISTRO DEL USUARIO
     *
     * * devuelve un booleano si se ha registrado con éxito o no
     */
    private function registrar()
    {
        $user = new User();
        $user->nombre_usuario = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password); // codificamos la contraseña


        // Guardamos el usuario en la base de datos
        // Save the user to the database
        if ($user->save()) {
            // Log in the user after successful registration
            Yii::$app->session->set('isUserLoggedIn', true);
            Yii::$app->session->set('username', $user->nombre_usuario);

            //si venimos del registro de gestores/propietarios
            if($this->esPropietario!==null)
            {
                $gestor = new Gestor();
                $gestor->id_usuario = $user->id_usuario;
                $gestor->es_propietario = $this->esPropietario;
                $gestor->save();
            }
            // si venimos del registro normal de clientes
            else
            {
                $cliente = new Cliente();
                $cliente->id_usuario = $user->id_usuario;
                $cliente->save();
            }

            return true; // Registration and login were successful
        }

    }

    /*
        BUSCA UN USUARIO POR SU NOMBRE

        * devuelve el usuario o null
    */
    public function getUser()
    {
        // si todavia no hay un usaurio cargado en el modelo lo buscamos por su nombre dado en el registro
        if ($this->_user === false) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user; //devolvemos el usuario o null dependiendo el resultado de la búsqueda
    }

}
