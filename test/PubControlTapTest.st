USING AxUnit;
USING Siemens.PubControl.TapBars;
USING Siemens.PubControl.Interfaces;

NAMESPACE Siemens.PubControl.Test

    {TestFixture}
    CLASS TestBasicTapBar

        VAR 
            tapBar : BasicTapBar;
        END_VAR

        {FixtureSetup}
        METHOD PUBLIC ResetAndConfigTapBar
            VAR_TEMP
                result : BOOL;
            END_VAR

            tapBar.Reset();
            tapBar.WatchDogDiffTime := LTIME#60s;
        
        END_METHOD

        // {Test}
        // METHOD PUBLIC TestMeasure100ms
        //     VAR_TEMP
        //         flow : Real := REAL#0.0;
        //         consumption : Real := REAL#0.0;
        //     END_VAR
        //     //20 ml are 1 impulse
        //     tapBar.CalcImpulses(LTIME#100ms, 4, 5);
        //     consumption := tapBar.GetConsumption();
        //     flow := tapBar.GetFlow();
        //     Assert.InRange(consumption, 0.04, 0.002);
        //     Assert.Equal(actual := flow, expected := REAL#720.0);
        // END_METHOD
        // {Test}
        // METHOD PUBLIC SecondTestMeasure100ms
        //     VAR_TEMP
        //         flow : Real := REAL#0.0;
        //         consumption : Real := REAL#0.0;
        //     END_VAR
        //     //20 ml are 1 impulse
        //     tapBar.CalcImpulses(LTIME#100ms, 4, 5);
        //     consumption := tapBar.GetConsumption();
        //     flow := tapBar.GetFlow();
        //     Assert.Equal(actual := consumption, expected := REAL#0.04);
        //     Assert.Equal(actual := flow, expected := REAL#720.0);
        // END_METHOD
    END_CLASS

END_NAMESPACE
