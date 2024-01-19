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
    public $rol = NULL;

    private $_user = false;

    /*
        REGLAS DE VALIDACIÓN DEL REGISTRO

        * devuelve un array con las reglas de validacion
    */
    public function rules()
    {
        return [
            [['username', 'email', 'password'], 'required'],
            ['email', 'email'],
            ['password', 'validatePassword'],
            ['rol', 'safe'],
            ['username', 'unique', 'targetClass' => 'app\models\Usuario', 'targetAttribute' => 'nombre_usuario', 'message' => 'Este nombre de usuario ya está en uso.'],
            ['email', 'unique', 'targetClass' => 'app\models\Usuario', 'message' => 'Este email ya está en uso.'],
        ];
    }

    /*
        ACCIÓN PARA VALIDAR LA CONTRASEÑA INTRODCIDA EN EL REGISTRO
    */
    public function validatePassword($attribute, $params)
    {
        //si no hay errores en el modelo
        if (!$this->hasErrors()) {

            if (strlen($this->password) < 6) {
                $this->addError($attribute, 'La contraseña debe tener almenos 6 carcateres.');
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

            // Si el usuario y email no existen, proceder con el registro
            $resultado = $this->registrar();
            return $resultado;
        
        } else {
            // Personalizar los mensajes de error para el formulario
            $errors = $this->getErrors();
    
            if (isset($errors['username'])) {
                $this->addError('username', $errors['username'][0]);
            }
    
            if (isset($errors['email'])) {
                $this->addError('email', $errors['email'][0]);
            }
    
            return false;
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
        $usuario = new Usuario();
        $usuario->nombre_usuario = $this->username;
        $usuario->email = $this->email;
        $usuario->setPassword($this->password); // codificamos la contraseña
        $usuario->id_foto_usuario = 1; //foto default
        $usuario->rol = $this->rol;
        $usuario->bloqueado = 0; //no bloqueado

        // Guardamo el usuario en la BD
        if ($usuario->save()) {
            // Iniciar sesión después del registro exitoso
            $identity = Usuario::findIdentity($usuario->id_usuario);
            Yii::$app->user->login($identity);
            //elimanmos las variables de ayuda para el registro
            if(Yii::$app->session->has('registroc')) Yii::$app->session->remove('registroc');
            if(Yii::$app->session->has('registrogp')) Yii::$app->session->remove('registrogp');
            return true; // Registration and login were successful
        }

        // Si hay algún problema con el guardado, imprime los errores para depuración
        print_r($usuario->errors);

        return false;

    }

}
