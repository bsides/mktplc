<?php
namespace ShoppingCart\Model;

use ArrayAccess;
use ArrayObject;
use Countable;
use Iterator;
use ShoppingCart\Storage;

class ShoppingCart implements Countable, ArrayAccess, Iterator
{
    /**
     * @type array
     */
    protected $items = [];

    /**
     * @type int
     */
    protected $total = 0;

    /**
     * @type null
     */
    protected $storage = NULL;

    /**
     * @param Storage\StorageInterface $storage
     */
    public function __construct( Storage\StorageInterface $storage = NULL )
    {
        if (NULL !== $storage) {
            $this->setStorage( $storage );
        }
        $storage = $this->getStorage();
        if (!$storage->isEmpty()) {
            $this->items = $storage->read();
        }
    }

    /**
     * @param Storage\StorageInterface $storage
     *
     * @return $this
     */
    public function setStorage( Storage\StorageInterface $storage )
    {
        $this->storage = $storage;
        return $this;
    }

    /**
     * @return StorageInterface
     */
    private function getStorage()
    {
        if (NULL === $this->storage) {
            $this->setStorage( new Storage\Session() );
        }
        return $this->storage;
    }

    /**
     * @param Item $item
     * @param      $qty
     *
     * @return bool|Item
     */
    public function addItem( Item $item )
    {
        if (0 > $item->getQuantity()) {
            return FALSE;
        }
        if (0 == $item->getQuantity()) {
            $this->removeItem( $item );
            return FALSE;
        }
        $this->items[$item->getId()] = $item;
        $this->persist();
        return $item;
    }

    /**
     * @param $item
     */
    public function removeItem( $item )
    {
        if (is_int( $item )) {
            unset($this->items[$item]);
        }
        if ($item instanceof Item) {
            unset($this->items[$item->getId]);
        }
        $this->persist();
    }

    private function persist()
    {
        $this->getStorage()
             ->clear();
        $this->getStorage()
             ->write( $this->items );
    }

    /**
     * @return int
     */
    public function getTotal()
    {
        $this->calculateTotal();
        return $this->total;
    }


    public function CalculateTotal()
    {
        $sub = 0;
        foreach ($this as $item) {
            $sub += $item->getPrice();
        }
        $this->total = $sub;
        $this->persist();
    }

    /**
     * @param mixed $offset
     *
     * @return mixed|null
     */
    public function offsetGet( $offset )
    {
        return $this->offsetExists( $offset ) ? $this->items[$offset] : NULL;
    }

    /**
     * @param mixed $offset
     *
     * @return bool
     */
    public function offsetExists( $offset )
    {
        return array_key_exists( $offset, $this->items );
    }

    /**
     * @param mixed $offset
     * @param mixed $value
     */
    public function offsetSet( $offset, $value )
    {
        $this->items[$offset] = $value;
    }

    /**
     * @param mixed $offset
     */
    public function offsetUnset( $offset )
    {
        if ($this->offsetExists( $offset )) {
            unset($this->_values[$offset]);
        }
    }

    /**
     * @return int|void
     */
    public function count()
    {
        return count( $this->items );
    }

    /**
     * (PHP 5 &gt;= 5.0.0)<br/>
     * Move forward to next element
     *
     * @link http://php.net/manual/en/iterator.next.php
     * @return void Any returned value is ignored.
     */
    public function next()
    {
        return next( $this->items );
    }

    /**
     * (PHP 5 &gt;= 5.0.0)<br/>
     * Return the key of the current element
     *
     * @link http://php.net/manual/en/iterator.key.php
     * @return mixed scalar on success, or null on failure.
     */
    public function key()
    {
        return key( $this->items );
    }

    /**
     * (PHP 5 &gt;= 5.0.0)<br/>
     * Checks if current position is valid
     *
     * @link http://php.net/manual/en/iterator.valid.php
     * @return boolean The return value will be casted to boolean and then evaluated.
     *       Returns true on success or false on failure.
     */
    public function valid()
    {
        return $this->current() !== FALSE;
    }

    /**
     * (PHP 5 &gt;= 5.0.0)<br/>
     * Return the current element
     *
     * @link http://php.net/manual/en/iterator.current.php
     * @return mixed Can return any type.
     */
    public function current()
    {
        return current( $this->items );
    }

    /**
     * (PHP 5 &gt;= 5.0.0)<br/>
     * Rewind the Iterator to the first element
     *
     * @link http://php.net/manual/en/iterator.rewind.php
     * @return void Any returned value is ignored.
     */
    public function rewind()
    {
        return reset( $this->items );
    }
}