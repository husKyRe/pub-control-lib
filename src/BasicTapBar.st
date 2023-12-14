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
            HOUR_IN_NS : LTIME := LTIME#3600000000ns;
        END_VAR
        lastConsumption := Impulses * Factor;
        consumption := consumption + lastConsumption;

        IF 0 < MeasureTime < WatchDogDiffTime THEN
           flow := (lastConsumption*MeasureTime*HOUR_IN_NS);
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
        flow := REAL#0.0
    END_METHOD

END_CLASS
END_NAMESPACE