NAMESPACE Siemens.Diagnostics

    // TODO Add Docu
    // TODO Integrate Error Handler
    TYPE
        typeAlarmEntry : STRUCT
            indexRegister : UINT;
            inUsed : BOOL;
            incomingTimestamp : DATE_AND_TIME;
            incomingRequestAlarm : BOOL;
            outgoingTimestamp : DATE_AND_TIME;
            outgoingRequestAlarm : BOOL;
            messageTextListId : UINT;
            messageTextListEntryId : UINT;
            additionalValue1 : INT;
            additionalValue2 : INT;
            additionalValue3 : INT;
            reference : STRING;
            referenceDesignator : STRING;
        END_STRUCT;
    END_TYPE

END_NAMESPACE
