<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Gestor]].
 *
 * @see Gestor
 */
class GestoresQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return Gestor[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Gestor|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
