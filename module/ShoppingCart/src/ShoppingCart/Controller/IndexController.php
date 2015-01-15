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
        return new JsonModel($cart->items);
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
        $request = $this->getRequest();
        if ($request->isXmlHttpRequest() === FALSE)
            return new JsonModel([]);

        if ('0' !== ($id = (string) $this->params('id'))) {
            $cart = $this->getServiceLocator()->get('cart.service');
            $cart->removeItem($id);
        }
        return new JsonModel(['message' => 'success']);
    }

    public function emptyAction()
    {
        $request = $this->getRequest();
        if ($request->isXmlHttpRequest() === FALSE)
            return new JsonModel([]);

        $cart = $this->getServiceLocator()->get('cart.service');
        $cart->clear();
        return new JsonModel(['message' => 'success']);
    }
}