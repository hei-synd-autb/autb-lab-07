FUNCTION BLOCK FB_GenerateP5

Au moment du Start, le temps du polynôme commence à incrementer.

|I/O      |Type     |Name         |Comment                         |
|---------|---------|-------------|--------------------------------|
|VAR_INPUT|         |             |                                |
|         |BOOL     |Enable       |                                |
|         |BOOL     |bStartForward|Start of motion at rising edge  |
|         |LREAL    |startPosition_mm|Start position of motion     |
|         |LREAL    |endPosition_mm|End position of motion    |
|         |UDINT    |udiCyclTime_ms|Cycle time in ms of the task where FB is running    |
|         |UDINT    |Cycle Time Multiplier, default is 1000 for 1000 ms|


FUNCTION_BLOCK FB_GenerateP5
VAR_INPUT
    // Start of motion at rising edge.
    bStartForward       : BOOL;
    // Should be 0 for first version, could be extended for any position
    startPosition_mm    : LREAL := 0;
    // Should be limited to 100 mm
    endPosition_mm      : LREAL := 0;
    // Cycle time in ms of the task where FB is running.
    udiCyclTime_ms      : UDINT;
    // Cycle time multiplier, used to compute duration of motion
    // This could be made automatically later,
    // Now result in Output
	// Cycle Time Multiplier, default is 1000 for 1000 ms
    udiCycleTimeMult    : UDINT;
END_VAR
VAR_IN_OUT
    // Used for verification of data, we do not nead them for motion
    arGoToPos           : ARRAY[0..GVL_CyclSetPoint.c_uiMaxProfilePoints] OF LREAL;
END_VAR
VAR_OUTPUT
    // Is time to execute the profile in ms
    // Multiplication of udiCyclTime_ms x udiCycleTimeMult
    udiMotionTime_ms    :  UDINT; 
    // Motion finished
    bDoneForward        : BOOL;
    // Motion set position
    lrSetPosition       : LREAL;
    // True if udiCycleTimeMult Exceeds, FB not executed
    bErrorTimeMultToBig : BOOL;
    // Point generator active
    bActive             : BOOL;
END_VAR
VAR
    // Time index of position
    discreteTimeIndex   : UDINT;
    // rising edge of start
    rStartForward       : R_TRIG;
    // Ce machin là va devoir être expliqué avec pas mal de détail en théorie.
    lrTimeScaler        : LREAL;
END_VAR
