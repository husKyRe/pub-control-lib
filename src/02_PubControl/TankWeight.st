USING Siemens.PubControl.Interfaces;
USING Siemens.PubControl.Types;

NAMESPACE Siemens.PubControl

    CLASS TankWeight EXTENDS TankTap
        VAR PUBLIC
            /// Weight in kilogram
            Weight : REAL;
        END_VAR
        VAR PROTECTED
            _maxLevelWeight : REAL;
            _factorLevelWeight : REAL;
        END_VAR

        METHOD PUBLIC OVERRIDE SetMaxLevel : INT
            VAR_INPUT
                /// Max level in liter
                MaxLevel : UINT;
            END_VAR
            IF Weight > 0 AND MaxLevel > UINT#0 THEN
                _maxLevel := MaxLevel;
                _currentLevel := MaxLevel;
                _maxLevelWeight := Weight;
                _factorLevelWeight := _maxLevel / _maxLevelWeight;
                SetMaxLevel := 0;
            ELSE
                SetMaxLevel := -1;
            END_IF;
            SUPER.CheckStatus();
        END_METHOD

        /// Level in liter
        METHOD PUBLIC OVERRIDE GetLevel : UINT
            _currentLevel := Weight * _factorLevelWeight;
            SUPER.CheckStatus();
            IF _currentLevel < 0  THEN
                GetLevel := UINT#0;
            ELSE
                GetLevel := TO_UINT(_currentLevel);
            END_IF;
            
        END_METHOD



    END_CLASS

END_NAMESPACE
