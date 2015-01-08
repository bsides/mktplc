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
        $request = $this->getRequest();
        if ($request->isXmlHttpRequest() === FALSE)
            return new JsonModel([]);

        $cart = $this->getServiceLocator()->get('cart.service');
        if ($request->isPost()) {
            $item = new Model\Item($request->getPost()->toArray());
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

    public function emptyAction()
    {
        $cart = $this->getServiceLocator()->get('cart.service');
        $cart->clear();
        return new JsonModel(['message' => 'success']);
    }
}