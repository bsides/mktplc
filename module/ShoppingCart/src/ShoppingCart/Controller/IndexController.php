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
            $return[$item->id]['id'] = $item->id;
            $return[$item->id]['name'] = $item->newspaper;
            $return[$item->id]['comment'] = $item->comment;
            $return[$item->id]['items'] = array_filter($cart->items, function($it) use($item) { return $item->newspaper = $it->newspaper; });
        }

        $return = array_filter($return, function($it) { return count($it['items']) > 0; });
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
        $request = $this->getRequest();
        if ($request->isXmlHttpRequest() === FALSE)
            return new JsonModel([]);

        $id = (int) $this->params('id');
        if (0 !== ($id = (int) $this->params('id'))) {
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