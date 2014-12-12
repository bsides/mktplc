<?php
namespace Application\Form;

use Zend\Form\Annotation\AnnotationBuilder;
use Application\Form\LoginForm;

class LoginFormBuilder
{

    public function newForm() {
        $builder = new AnnotationBuilder();
        $form = $builder->createForm(new LoginForm());

        $form->add(array(
            'name' => 'btn-login',
            'attributes' => array(
                'type' => 'submit',
                'value' => 'Entrar',
                'id' => 'btn-login',
                'class' => 'btn green pull-right'
            ),
        ));

        return $form;
    }

}