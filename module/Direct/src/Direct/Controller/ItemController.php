<?php
/**
 * Predicta Market Place
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */
namespace Direct\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;
use Direct\Model;

/**
 * Class ListController
 *
 * @package Direct\Controller
 */
class ItemController extends AbstractActionController
{
    /**
     * @return array|JsonModel
     */
    public function indexAction()
    {
        $service = $this->getServiceLocator()->get('direct.newspaper.item');
        $params = $this->getRequest()->getQuery()->toArray();
        return new JsonModel($service->find($params)['data']);
    }

}
