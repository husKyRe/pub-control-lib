USING AxUnit;
USING Siemens.Calculator;

NAMESPACE Siemens.Calculator.Test

    {TestFixture}
    CLASS TestCalc

        VAR PROTECTED
            instAddCalc : Add;
            instSubCalc : Sub;                
            values : Array[0..63] of REAL; 
        END_VAR

        METHOD InitArray
            values[0] := REAL#3.0;
            values[1] := REAL#9.0;
            values[2] := REAL#30.0;
        END_METHOD

        {Test(operand1 := 9, operand2 := 30, result := 39)}
        {Test(operand1 := 9, operand2 := -30, result := -21)}
        METHOD PUBLIC TestAddCalc
            VAR_INPUT
                operand1 : REAL;
                operand2 : Real;
                result : Real;
            END_VAR
            VAR_TEMP
                myResult : REAL ;
            END_VAR
            myResult := instAddCalc.Calc(operand1, operand2);
            Assert.Equal(actual := myResult, expected := result);
        
        END_METHOD

        {Test(operand1 := 9, operand2 := 30, result := -21)}
        {Test(operand1 := 9, operand2 := -30, result := 39)}
        {Test(operand1 := 9, operand2 := 2, result := 7)}
        METHOD PUBLIC TestSubCalc
            VAR_INPUT
                operand1 : REAL;
                operand2 : Real;
                result : Real;
            END_VAR
            VAR_TEMP
                myResult : REAL ;
            END_VAR
            myResult := instSubCalc.Calc(operand1, operand2);
            Assert.Equal(actual := myResult, expected := result);
        
        END_METHOD

        {Test}
        METHOD PUBLIC TestAddArrayCalc
            VAR_TEMP
                myResult : Real;
            END_VAR
            THIS.InitArray();
            myResult := instAddCalc.ArrayCalc(values);
            Assert.Equal(actual := myResult, expected := 42);
        
        END_METHOD

        {Test}
        METHOD PUBLIC TestSubArrayCalc
            VAR_TEMP
                myResult : REAL;
            END_VAR
            THIS.InitArray();
            myResult := instSubCalc.ArrayCalc(values);
            Assert.Equal(actual := myResult, expected := -42);
        
        END_METHOD
    END_CLASS

END_NAMESPACE
