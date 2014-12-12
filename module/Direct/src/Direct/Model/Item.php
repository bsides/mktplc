<?php
namespace Direct\Model;

use Zend\I18n\Filter\NumberFormat;

/**
 * Class Category
 *
 * @package Direct\Model
 */
class Item
{
    public function fetchAll()
    {
        $return = [];
        $color[] = 'PB';
        $color[] = 'Cormia';
        $color[] = 'Cormia, PB';

        $format[] = 'Rodapé';
        $format[] = 'Meia Página';
        $format[] = 'Página Inteira';

        $column[] = 'Política';
        $column[] = 'Esportes';

        $newspaper[] = 'Estadão';
        $newspaper[] = 'Folha';
        $newspaper[] = 'O Globo';

        $weekDays[] = 'Segundas';
        $weekDays[] = 'Terças';
        $weekDays[] = 'Domingos';

        setlocale(LC_MONETARY, 'pt_BR');
        for($x=0; $x<=rand(3,8); $x++) {
            $deal['id'] = rand(1,999);
            $deal['color'] = $color[rand(0,2)];
            $deal['price'] = money_format('%.2n', rand(1000.00,99999.00));
            $deal['column'] = $column[rand(0,1)];
            $deal['format'] = $format[rand(0,2)];
            $deal['newspaper'] = $newspaper[rand(0,2)];
            $deal['weekDays'] = $weekDays[rand(0,2)];
            $deal['image'] = 'http://cdni.wired.co.uk/1920x1280/o_r/Pug.jpg';

            $return[] = $deal;
        }

        return $return;
    }
}