NAMESPACE Siemens.Calculator
    {axcode:docs-v0:@rc-de-tc-ax/pub-control-lib:Calc.md}
    CLASS Add EXTENDS BaseCalc
        VAR
            result : REAL;
        END_VAR

        METHOD PUBLIC OVERRIDE Calc : REAL
            VAR_INPUT
                operand1 : Real;
                operand2 : Real;
            END_VAR
            result := operand1 + operand2;
            Calc := result;
        END_METHOD

        METHOD PUBLIC OVERRIDE ArrayCalc : REAL
            VAR_INPUT
                ArrayOperand : ARRAY [0..63] OF REAL;
            END_VAR
            VAR_TEMP
                index : DINT;
            END_VAR
            result := 0;
            FOR index := 0 TO 63 DO
                result := result + ArrayOperand[index];
            END_FOR;
            ArrayCalc := result;
        END_METHOD
    END_CLASS
END_NAMESPACE