<?php
namespace Direct\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;

class ListController extends AbstractActionController
{
    public function indexAction()
    {
        return new JsonModel( [] );
    }

    public function newspaperAction()
    {
        $newspaper = $this->getServiceLocator()
                          ->get( 'Newspaper' );

        return new JsonModel( $newspaper->get( ) );
    }

    public function categoryAction()
    {
        $service = $this->getServiceLocator()
                          ->get( 'Category' );

        return new JsonModel( $service->get( ) );
    }

    public function colorAction()
    {
        $service = $this->getServiceLocator()
                        ->get( 'Color' );

        return new JsonModel( $service->get( ) );
    }

    public function determinationAction()
    {
        $service = $this->getServiceLocator()
                        ->get( 'Determination' );

        return new JsonModel( $service->get( ) );
    }

    public function formatAction()
    {
        $service = $this->getServiceLocator()
                        ->get( 'Format' );

        return new JsonModel( $service->get( ) );
    }

    public function profileAction()
    {
        $service = $this->getServiceLocator()
                        ->get( 'profile' );

        return new JsonModel( $service->get( ) );
    }

    public function weekDayAction()
    {
        $service = $this->getServiceLocator()
                        ->get( 'WeekDay' );

        return new JsonModel( $service->get( ) );
    }
}
