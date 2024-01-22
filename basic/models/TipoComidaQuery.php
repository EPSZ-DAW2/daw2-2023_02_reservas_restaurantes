<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[TipoComida]].
 *
 * @see TipoComida
 */
class TipoComidaQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return TipoComida[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return TipoComida|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
