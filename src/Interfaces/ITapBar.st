NAMESPACE PubControl.Interfaces
    INTERFACE ITapBar
        
        METHOD CalcImpulses
            VAR_INPUT
                MeasureTime : LTIME;
                Impulses : INT;
                Factor : INT;
            END_VAR

        END_METHOD

        METHOD GetConsumption : Real           
        END_METHOD

        METHOD GetFlow : Real
        END_METHOD

        METHOD Reset
        END_METHOD

    END_INTERFACE
    
END_NAMESPACE