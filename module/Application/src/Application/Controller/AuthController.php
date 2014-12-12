<?php

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Application\Form\LoginForm;

class AuthController extends AbstractActionController
{
    protected $authservice;

    private function getAuthService()
    {
        if (is_null($this->authservice)) {
            $this->authservice = $this->getServiceLocator()->get('auth.service');
        }

        return $this->authservice;
    }

    private function getForm()
    {
        $sm = $this->getServiceLocator();
        return $sm->get('form.login')->newForm();
    }

    public function loginAction()
    {
        $request = $this->getRequest();
        $auth = $this->getAuthService();

        // já autenticado
        if ($auth->hasIdentity()) {
            $this->redirect()->toRoute('home');
        }

        // form
        $form = $this->getForm();
        // valida form
        if ($request->isPost()) {
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $auth->getAdapter()->setUsername($request->getPost('username'));
                $auth->getAdapter()->setPassword($request->getPost('password'));
                $result = $auth->authenticate();

                if ($result->isValid()) {

                    $auth->getStorage()->write(array(
                        'username' => $request->getPost('username'),
                        'identity' => $result->getIdentity(),
                    ));

                    $this->redirect()->toRoute('home');
                } else {
                    $success = false;
                    $message = implode(PHP_EOL, $result->getMessages());
                }
            }
        }

        $view = new ViewModel(array(
            'form' => $form,
            'success' => (isset($success)) ? $success : null,
            'message' => (isset($message)) ? $message : '',
        ));
        $view->setTerminal(true);

        return $view;
    }

    public function logoutAction()
    {
        $this->getAuthService()->clearIdentity();

        return $this->redirect()->toRoute('login');
    }
}