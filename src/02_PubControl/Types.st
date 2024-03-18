NAMESPACE Siemens.PubControl.Types
    TYPE
        TankStatus : INT (OFF := 0, READY := 1, FULL := 2, TAPPING := 3, EMPTY := -1, CIP := -2) := OFF;
    END_TYPE
    
END_NAMESPACE