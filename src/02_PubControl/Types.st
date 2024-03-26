NAMESPACE Siemens.PubControl.Types
    TYPE
        TankStatus : INT (ACTIVE := 0,  Tapped := 1, TANKING := 2, EMPTY := 4, SERVICE := 3) := ACTIVE;
    END_TYPE
    
    TYPE
        QualityData : STRUCT
            /// Time how long is tank full with medium (in days)
            occupancyPeriod : REAL;
            /// Time how long tank is empty (in days)
            emptinessPeriod : REAL;
            /// Time how long it needed to empty tank (in days)
            emptyingPeriod : REAL;
            /// delivery date
            deliveryDate : DATE_AND_TIME;
            /// Change inliner last time 
            inlinerDate : DATE_AND_TIME;
        END_STRUCT;
    END_TYPE


END_NAMESPACE