USING AxUnit;
USING PubControl.TapBars;
USING PubControl.Interfaces;

NAMESPACE MyTest

    {TestFixture}
    CLASS MyTestFixture

        VAR 
            tapBar : BasicTapBar;
        END_VAR

        {Test}
        METHOD PUBLIC ResetAndConfigTapBar
            VAR_TEMP
                result : BOOL;
            END_VAR

            tapBar.Reset();
            tapBar.WatchDogDiffTime := LTIME#3600s;
        
        END_METHOD

        {Test}
        METHOD PUBLIC TestMeasure100ms
            VAR_TEMP
                flow : Real := REAL#0.0;
                consumption : Real := REAL#0.0;
            END_VAR
            //20 ml are 1 impulse
            tapBar.CalcImpulses(LTIME#100ms, 100, 20);
            consumption := tapBar.GetConsumption();
            flow := tapBar.GetFlow();
            Assert.Equal(actual := consumption, expected := REAL#2.0);
            Assert.Equal(actual := flow, expected := REAL#72.000);
        END_METHOD
    END_CLASS

END_NAMESPACE
