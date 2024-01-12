USING PubControl.Interfaces;

NAMESPACE PubControl.TapBars
    CLASS BasicTapBar IMPLEMENTS ITapBar      
        VAR PRIVATE
            consumption : REAL;
            lastConsumption : REAL;
            flow : REAL;
        END_VAR

        VAR PUBLIC
            WatchDogDiffTime : LTIME;
        END_VAR 
        
        METHOD PUBLIC CalcImpulses
            VAR_INPUT
                MeasureTime : LTIME;
                Impulses : INT;
                Factor : INT;
            END_VAR
            VAR CONSTANT
                HOUR_IN_NS : LINT := LINT#3600000000;
                ML_IN_L : INT := INT#1000;
            END_VAR
            lastConsumption := (Impulses * Factor)/ML_IN_L;
            consumption := consumption + lastConsumption;
            

            IF (LTIME#0ns < MeasureTime AND  MeasureTime < WatchDogDiffTime) THEN
                flow := (lastConsumption * TO_REAL(TO_LINT(MeasureTime*HOUR_IN_NS)));
            END_IF;
        END_METHOD

        METHOD PUBLIC GetConsumption : REAL
            GetConsumption := consumption;
        END_METHOD

        METHOD PUBLIC GetFlow : REAL
            GetFlow := flow;
        END_METHOD

        METHOD PUBLIC Reset
            consumption := REAL#0.0;
            flow := REAL#0.0;
        END_METHOD

    END_CLASS
END_NAMESPACE