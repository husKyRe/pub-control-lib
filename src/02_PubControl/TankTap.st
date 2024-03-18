USING Siemens.PubControl.Interfaces;
USING Siemens.PubControl.Types;

NAMESPACE Siemens.PubControl
    // TODO HMI Interface
    CLASS TankTap
        IMPLEMENTS ITank
        VAR PUBLIC
        END_VAR
        VAR PROTECTED
            _maxLevel : UINT;
            _status : TankStatus := TankStatus#OFF;
            _currentLevel : REAL;
        END_VAR

        METHOD PUBLIC SetMaxLevel : INT
            VAR_INPUT
                /// Max level in liter
                MaxLevel : UINT;
            END_VAR
            IF MaxLevel > UINT#0 THEN
                _maxLevel := MaxLevel;
                SetMaxLevel := 0;
            ELSE
                SetMaxLevel := -1;
            END_IF;
            THIS.CheckStatus();
        END_METHOD

        // TODO Test me
        METHOD PUBLIC FINAL Consume : TankStatus
            VAR_INPUT
                consumption : REAL;
            END_VAR
            IF (_currentLevel - consumption) < 0 THEN
                _currentLevel := 0;
            ELSE
                _currentLevel := _currentLevel - consumption;
            END_IF;
            THIS.GetStatus();
            Consume := _status;
        END_METHOD

        /// Level in liter
        METHOD PUBLIC GetLevel : UINT
            GetLevel := TO_UINT(_currentLevel);
        END_METHOD

        METHOD PUBLIC GetStatus : TankStatus
            GetStatus := _status;
        END_METHOD

        METHOD PUBLIC Cleaning
            VAR_INPUT
                Start : BOOL;
                Stop : BOOL;
            END_VAR
            ;
        END_METHOD

        METHOD PROTECTED CheckStatus
            VAR_TEMP
                level : UINT;
            END_VAR
            level := TO_UINT(_currentLevel);
            IF _maxLevel = level THEN
                _status := TankStatus#FULL;
            ELSIF UINT#0 < level AND level < _maxLevel THEN
                _status := TankStatus#TAPPING;
            ELSIF level <= UINT#0  THEN
                _status := TankStatus#EMPTY;
            ELSE
                _status := TankStatus#OFF;
            END_IF;
        END_METHOD
    END_CLASS

END_NAMESPACE
