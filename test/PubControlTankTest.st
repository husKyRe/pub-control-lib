USING AxUnit;
USING Siemens.PubControl.TapBars;
USING Siemens.PubControl.Interfaces;
USING Siemens.PubControl.Types;

NAMESPACE Siemens.PubControl.Test

    {TestFixture}
    CLASS TestTank
        VAR
            tank : TankTap;
        END_VAR

        {FixtureSetup}
        METHOD PUBLIC ResetAndConfigTapBar
            VAR_TEMP
                result : BOOL;
            END_VAR
            tank.SetMaxLevel(UINT#900);
            tank.Tanking();
        END_METHOD

        {Test}
        METHOD PUBLIC TestLevel
            VAR_TEMP
                status : TankStatus;
                level : UINT := UINT#0;
            END_VAR
            level := tank.GetLevel();
            status := tank.GetStatus();
            Assert.Equal(expected := TankStatus#FULL, actual := status);
            Assert.Equal(actual := level, expected := UINT#900);
        END_METHOD

        {Test(consume := REAL#2.0, exceptedlevel:= UINT#898)}
        METHOD PUBLIC Tapping
            VAR_INPUT
                consume : REAL;
                exceptedlevel : UINT := UINT#0;
            END_VAR
            VAR_TEMP
                status : TankStatus;
                currentlevel : UINT := UINT#0;
            END_VAR
            tank.Consume(consume);
            currentlevel := tank.GetLevel();
            status := tank.GetStatus();
            Assert.Equal(actual := status, expected := TankStatus#TAPPING);
            Assert.Equal(actual := currentlevel, expected := exceptedlevel);
        END_METHOD
    END_CLASS

END_NAMESPACE
