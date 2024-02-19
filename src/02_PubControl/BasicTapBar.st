USING Siemens.PubControl.Interfaces;

NAMESPACE Siemens.PubControl.TapBars
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
                HOUR_IN_NS : REAL := REAL#3.6e12;
                ML_IN_L : REAL := REAL#1000.0;
            END_VAR
            VAR_TEMP
                calculatedTime : REAL := REAL#0.0;
            END_VAR
            lastConsumption := (Impulses * Factor)/ML_IN_L;
            consumption := consumption + lastConsumption;
            

            IF (LTIME#0ns < MeasureTime AND  MeasureTime < WatchDogDiffTime) THEN
                calculatedTime := (TO_REAL(TO_LINT(MeasureTime)));
                flow := lastConsumption * (HOUR_IN_NS/calculatedTime);
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