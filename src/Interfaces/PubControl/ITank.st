USING Siemens.PubControl.Types;
NAMESPACE Siemens.PubControl.Interfaces
    INTERFACE ITank
        METHOD SetMaxLevel : INT
            VAR_INPUT
                MaxLevel : UINT;
            END_VAR   
        END_METHOD

        METHOD GetLevel : UINT
                        
        END_METHOD

        METHOD GetStatus : TankStatus
                        
        END_METHOD

        METHOD Cleaning
            VAR_INPUT
                Start : BOOL;
                Stop : BOOL;
            END_VAR 
        END_METHOD

    END_INTERFACE
END_NAMESPACE