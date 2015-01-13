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
        $post = $this->getRequest()->getPost()->toArray();
        $itemGateway = new Model\Item();
        return new JsonModel( $itemGateway->fetchAll( $post ) );
    }

}
