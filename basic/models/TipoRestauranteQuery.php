<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[TipoRestaurante]].
 *
 * @see TipoRestaurante
 */
class TipoRestauranteQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return TipoRestaurante[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return TipoRestaurante|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
