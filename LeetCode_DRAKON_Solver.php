<?php

/** @noinspection PhpUnused */
/** @noinspection PhpUnusedLocalVariableInspection */

declare(strict_types=1);
// Autogenerated with DRAKON Editor 


function bool_OR(...$args) {
    // item 41
    /*
    функция логическая ИЛИ
    */
    // item 40
    return in_array(true, $args, true);
}

function n20_Valid_Parentheses(string $s) {
    // item 32
    /*
    
    Given a string s containing just the characters 
    '(', ')', '{', '}', '[' and ']', 
    determine if the input string is valid.
    
    An input string is valid if:
    
    Open brackets must be closed 
    by the same type of brackets.
    Open brackets must be closed 
    in the correct order.
    Every close bracket has a corresponding 
    open bracket of the same type.
    
    Example:
    
    Input: $s = "([][])"
    Output: true
    
    */
    // item 12
    $iLen = strlen($s);
    // item 43
    $ret = true;
    // item 13
    if (// чётная

!$iLen & 1) {
        // item 34
        $mapClosed = [
        	')' => '(',
        	'}' => '{',
        	']' => '['
        ];
        // item 18
        $iLen = strlen($s);
        // item 190001
        $i = 0;
        while (true) {
            // item 190002
            if ($i < $iLen) {
                
            } else {
                break;
            }
            // item 33
            $char = $s[$i];
            // item 21
            if (in_array($char, $mapClosed)) {
                // item 45
                // скобка ЗАКРЫВАЮЩАЯ
                // item 24
                if (bool_OR(
	empty($stack),
	array_pop($stack) !== $mapClosed[$char])) {
                    // item 42
                    $ret = false;
                    break;
                } else {
                    
                }
            } else {
                // item 44
                // скобка ОТКРЫВАЮЩАЯ
                // item 31
                $stack[] = $char;
            }
            // item 190003
            $i++;
        }
    } else {
        // item 16
        $ret = false;
    }
    // item 17
    return $ret;
}

function n20_Valid_Parentheses_Test() {
    // item 11
    $s = '[';
    $res = n20_Valid_Parentheses($s);
    assert($res === false, $s);

    $s ='[(';
    $res = n20_Valid_Parentheses($s);
    assert($res === false, $s);

    $s = '[()]';
    $res = n20_Valid_Parentheses($s);
    assert($res === true);
}



