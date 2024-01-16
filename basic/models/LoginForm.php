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
            // Comprobamos si el usuario dado ya existe
            $existingUser = $this->getUser();

            $remainingAttempts = $this->getLoginAttempts();

            // If the user doesn't exist
            if ($existingUser === null) {
                $this->decrementLoginAttempts();
                // If remaining attempts are zero, block the session
                if ($remainingAttempts <= 0) { 
                    Yii::$app->session->setFlash('error', 'Sesión bloqueada. Demasiados intentos fallidos.');
                // left attempts
                } else {
                    Yii::$app->session->setFlash('warning', "Usuario o contraseña incorrectos. Intentos restantes: $remainingAttempts");
                }
                return false;
            }

            // If the user exists check if the passwords are the same
            if ($existingUser->password === $this->password)
            {
                Yii::$app->session->set('isUserLoggedIn', true);
                Yii::$app->session->set('username', $this->username);

                return true; // login successful
            }
            // If are different
            else
            {
                $this->decrementLoginAttempts();
                // If remaining attempts are zero, block the session
                if ($remainingAttempts <= 0) { 
                    Yii::$app->session->setFlash('error', 'Sesión bloqueada. Demasiados intentos fallidos.');
                // left attempts
                } else {
                    Yii::$app->session->setFlash('warning', "Usuario o contraseña incorrectos. Intentos restantes: $remainingAttempts");
                }
                return false;
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
        if ($this->_user === false) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
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
            Yii::$app->session->set('loginAttempts', 3);
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
