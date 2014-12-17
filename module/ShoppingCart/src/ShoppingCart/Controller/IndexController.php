<?php
namespace ShoppingCart\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;
use ShoppingCart\Model;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        $cart = $this->getServiceLocator()->get('cart.service');
        $return = [];
        foreach($cart as $item) {
            $return[] = get_object_vars($item);
        }
        return new JsonModel($return);
    }

    public function addAction()
    {
        $cart = $this->getServiceLocator()->get('cart.service');
        for($x=1; $x<=rand(2,10); $x++) {
            $item = new Model\Item;
            $item->setId($x);
            $item->setName('Item ' . $x);
            $item->setQuantity(rand(1,20));
            $item->setPrice(floatval(rand(100,2000)));
            $cart->addItem($item);
        }
        return new JsonModel(['message' => 'success']);
    }

    public function deleteAction()
    {
        $id = (int) $this->params('id');
        if (0 !== ($id = (int) $this->params('id'))) {
            $cart = $this->getServiceLocator()->get('cart.service');
            $cart->removeItem($id);
        }
        return new JsonModel(['message' => 'success']);
    }
}