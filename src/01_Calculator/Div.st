NAMESPACE Siemens.Calculator
    CLASS Div EXTENDS BaseCalc
        VAR
            result : REAL;
        END_VAR
    
        
    
    METHOD PUBLIC OVERRIDE Calc : REAL
        VAR_INPUT
            operand1 : REAL;
            operand2 : REAL;
        END_VAR
            result := operand1 / operand2;
            Calc := result;
    END_METHOD

    METHOD PUBLIC OVERRIDE ArrayCalc : REAL
        VAR_INPUT
            ArrayOperand : ARRAY [0..63] OF REAL;
        END_VAR
        ArrayCalc := 0;
        
    END_METHOD
END_CLASS
END_NAMESPACE