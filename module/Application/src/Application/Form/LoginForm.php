<?php
namespace Application\Form;

use Zend\Form\Form,
    Zend\Form\Annotation;

/**
 * @Annotation\Hydrator("Zend\Stdlib\Hydrator\ObjectProperty")
 * @Annotation\Name("form-login")
 * @Annotation\Attributes({"method": "post"})
 * @Annotation\Attributes({"role": "form"})
 * @Annotation\Attributes({"id": "form-login"})
 */
class LoginForm
{

    /**
     * @Annotation\Required(true)
     * @Annotation\Type("Zend\Form\Element\Text")
     * @Annotation\Filter({"name":"StringTrim"})
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({
     *    "label":"Email",
     * })
     * @Annotation\Attributes({
     *    "placeholder": "Email",
     *    "id": "username"
     * })
     */
    public $username;

    /**
     * @Annotation\Required(true)
     * @Annotation\Type("Zend\Form\Element\Password")
     * @Annotation\Filter({"name":"StringTrim"})
     * @Annotation\Filter({"name":"StripTags"})
     * @Annotation\Options({
     *    "label":"Senha",
     * })
     * @Annotation\Attributes({
     *    "placeholder": "Senha",
     *    "id": "password"
     * })
     */
    public $password;

}