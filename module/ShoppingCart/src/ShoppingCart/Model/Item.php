<?php
namespace ShoppingCart\Model;

class Item
{
    /**
     * @type integer
     */
    public $id;

    /**
     * @type string
     */
    public $name;

    /**
     * @type integer
     */
    public $determination;

    /**
     * @type integer
     */
    public $format;

    /**
     * @type integer
     */
    public $color;

    /**
     * @type integer
     */
    public $weekDay;

    /**
     * @type decimal
     */
    public $price;

    /**
     * @type integer
     */
    public $quantity;

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     *
     * @return $this;
     */
    public function setId( $id )
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     *
     * @return $this;
     */
    public function setName( $name )
    {
        $this->name = $name;
        return $this;
    }

    /**
     * @return decimal
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param decimal $price
     *
     * @return $this;
     */
    public function setPrice( $price )
    {
        $this->price = $price;
        return $this;
    }

    /**
     * @return int
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * @param int $quantity
     *
     * @return $this;
     */
    public function setQuantity( $quantity )
    {
        $this->quantity = $quantity;
        return $this;
    }

}