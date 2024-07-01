(*
	www.hevs.ch
	Institut Systemes Industriels
	Project: 	Projet No: PW MoveCyclic
	Author:		Cedric Lenoir
	Date:		2024 May 16
	
	Summary:	Example of list of states for state machine
    Notes:      The basic data type for an enumeration declaration is INT by default. 
                However, you can also declare enumerations that are based explicitly on another integer data type.
                Here: DINT

                The value default can be set explicitly: here dIdle      
*)
{attribute 'qualified_only'}
{attribute 'strict'}
TYPE E_ExecuteCornerP5 :
(
    eIdle := 999,
	eSomeInit := 10,
	
 	(* Auxiliary discrete motion*)   
    eMoveToCornerOne := 110,
    eMoveToCornerOneDone := 120,
	
 	(* Motion with P5*)   
    eMoveToCornerTwo 	:= 230,
	eEnableP5		:= 240,
	eCyclicSetPoint := 250,
	eFollowP5 		:= 260,
	eStopCyclic 	:= 270,
	eStopDone 		:= 280,
	eMoveToCornerTwoDone := 290,
    
 	(* Auxiliary discrete motion*)   
	eMoveToCornerThree := 310,
    eMoveToCornerThreeDone := 320
)DINT := eIdle;
END_TYPE
