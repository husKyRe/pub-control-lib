USING AxUnit;
USING Siemens.PubControl.TapBars;
USING Siemens.PubControl.Interfaces;
USING Siemens.PubControl.Types;

NAMESPACE Siemens.PubControl.Test

    {TestFixture}
    CLASS TestTank
        VAR
            tank : TankWeight;
        END_VAR

        {FixtureSetup}
        METHOD PUBLIC ResetAndConfigTapBar
            VAR_TEMP
                result : BOOL;
            END_VAR
            tank.Weight := 880;
            tank.SetMaxLevel(UINT#900);
        END_METHOD

        {Test}
        METHOD PUBLIC TestLevelStatus
            VAR_TEMP
                status : TankStatus;
                level : UINT := UINT#0;
            END_VAR
            status := tank.GetStatus();
            level := tank.GetLevel();
            Assert.Equal(actual := status, expected := TankStatus#FULL);
            Assert.Equal(actual := level, expected := UINT#900);
        END_METHOD

        {Test(weight := REAL#500.0, exceptedlevel:= UINT#511)}
        {Test(weight := REAL#468.3, exceptedlevel:= UINT#479)}
        METHOD PUBLIC Tapping
            VAR_INPUT
                weight : REAL;
                exceptedlevel : UINT := UINT#0;
            END_VAR
            VAR_TEMP
                status : TankStatus;
                currentlevel : UINT := UINT#0;
            END_VAR
            tank.Weight := weight;
            status := tank.GetStatus();
            currentlevel := tank.GetLevel();
            Assert.Equal(actual := status, expected := TankStatus#TAPPING);
            Assert.Equal(actual := currentlevel, expected := exceptedlevel);
        END_METHOD
    END_CLASS

END_NAMESPACE
