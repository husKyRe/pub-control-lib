USING PubControl.Interfaces;

NAMESPACE PubControl.TapBars
    CLASS ExtendedTapBar IMPLEMENTS ITapBar
        VAR PUBLIC
            
        END_VAR
        VAR PROTECTED
            
        END_VAR
        
        METHOD PUBLIC MyMethod
            ;
        END_METHOD
    
        METHOD PUBLIC CalcImpulses
            VAR_INPUT
                MeasureTime : LTIME;
                Impulses : INT;
                Factor : INT;
            END_VAR

            ;
        END_METHOD
    
        METHOD PUBLIC GetConsumption : REAL
            ;
        END_METHOD
    
        METHOD PUBLIC GetFlow : REAL
            ;
        END_METHOD
    
        METHOD PUBLIC Reset
            ;
        END_METHOD
    END_CLASS
    
END_NAMESPACE