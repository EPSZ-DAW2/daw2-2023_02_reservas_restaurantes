<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[ControlRestaurantes]].
 *
 * @see ControlRestaurantes
 */
class ControlRestaurantesQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return ControlRestaurantes[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return ControlRestaurantes|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
