<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property-read User|null $user
 *
 */
class LoginForm extends Model
{
    public $username;
    public $password;

    private $_user = false;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
        ];
    }


    /**
     * Logs in a user using the provided username and password.
     * @return bool whether the user is logged in successfully
     */
    public function login()
    {
        //comprobamos si los datos del login cumplen las reglas
        if ($this->validate()) {

            // Comprobamos si los datos son válidos
            $existingUser = $this->getUser();

            // No son validos
            if ($existingUser === null) {
                $this->decrementLoginAttempts();

                //comprobamos los intentos restantes
                $remainingAttempts = $this->getLoginAttempts();

                if ($remainingAttempts <= 0)
                    Yii::$app->session->setFlash('error', 'Sesión bloqueada. Demasiados intentos fallidos.');
                else 
                    Yii::$app->session->setFlash('warning', "Usuario o contraseña incorrectos. Intentos restantes: $remainingAttempts");

                return false;
            }
            // Si son validos
            else
            {
                Yii::$app->user->login($existingUser);
                //eliminamos la variable de control de intentos
                if(Yii::$app->session->has('loginAttempts')) Yii::$app->session->remove('loginAttempts');
                return true;
            }

        }

        //si no son correctos o algo falla
        return false;
    }



    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    public function getUser()
    {
        // Buscar un usuario por nombre de usuario y contraseña
        $usuario = Usuario::findOne(['nombre_usuario' => $this->username]);

        // Verificar si se encontró un usuario y si la contraseña es válida
        if ($usuario && $usuario->validatePassword($this->password)) {
            return $usuario;
        } else {
            return null;
        }
    }


    /**
     * Get the number of login attempts from the session
     *
     * @return int
     */
    private function getLoginAttempts()
    {
        // Verificar si la clave 'loginAttempts' existe en la sesión
        if (!Yii::$app->session->has('loginAttempts')) {
            // Si no existe, asignar el valor predeterminado (3)
            Yii::$app->session->set('loginAttempts', 4);
        }

        // Obtener y devolver el valor de 'loginAttempts'
        return (int) Yii::$app->session->get('loginAttempts');
    }

    /**
     * Increment the number of login attempts in the session
     */
    private function decrementLoginAttempts()
    {
        $attempts = $this->getLoginAttempts() -1;
        Yii::$app->session->set('loginAttempts', $attempts);
    }

}
