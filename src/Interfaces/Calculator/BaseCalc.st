NAMESPACE Siemens.Calculator
    {axcode:docs-v0:demo-tiax-lib:Calc.md}
    CLASS ABSTRACT BaseCalc
        VAR 
            overflow : bool;
        END_VAR

        METHOD PUBLIC ABSTRACT Calc : REAL 
            VAR_INPUT
                operand1 : REAL;
                operand2 : REAL;
            END_VAR
        END_METHOD

        METHOD PUBLIC ABSTRACT ArrayCalc : REAL 
            VAR_INPUT
                ArrayOperand : ARRAY[0..63] OF REAL;
            END_VAR
        END_METHOD
    END_CLASS
END_NAMESPACE