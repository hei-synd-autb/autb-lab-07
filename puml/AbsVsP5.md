@startuml

[*] --> Idle

note right of Idle 
    After Starting:
    should be at c1;
end note

Idle --> SomeInit

SomeInit --> MoveCornerTwo


MoveCornerOne --> MoveCornerOneDone
note right of MoveCornerOne
    Return to C1 with MoveAbs;
end note
note left of MoveCornerOne
    X axis at position 0;
end note


MoveCornerOneDone --> MoveCornerTwo

MoveCornerTwo --> CyclicSetPoint
note right of MoveCornerTwo
    Motion to c1 with P5;
end note

CyclicSetPoint --> FollowP5
note left of CyclicSetPoint
    MB_CyclicSetPoint;
end note

FollowP5 --> StopCyclic
note left of FollowP5
    FB_GenerateP5;
end note

StopCyclic --> StopDone
note left of StopCyclic
    MC_Stop;
end note

StopDone --> MoveCornerTwoDone


MoveCornerTwoDone -->  MoveCornerOne
@enduml