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
    public $newspaper;

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

    public function __construct(array $options = null)
    {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }

    public function setOptions(array $options)
    {
        $vars = get_object_vars($this);
        array_filter($options, function(&$item) {
            if (!is_array($item)) {
                $item = trim($item);
            }
        });

        foreach ($options as $var => $value) {
            if (in_array($var, array_keys($vars))) {
                $this->{$var} = $value;
            }
        }
        return $this;
    }

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