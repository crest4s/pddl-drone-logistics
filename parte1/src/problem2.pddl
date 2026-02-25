(define (problem problem2)
(:domain drone-domain)
(:objects
    depot loc1 loc2 - location
    drone1 - drone
    box1 box2 box3 - box
    person1 person2 - person
    food medicine - content
    left right - arm
)

(:init
    (at-drone drone1 depot)
    (at-box box1 depot)
    (at-box box2 depot)
    (at-box box3 depot)
    (available box1)
    (available box2)
    (available box3)
    (at-person person1 loc1)
    (at-person person2 loc2)
    (box-content box1 food)
    (box-content box2 medicine)
    (box-content box3 food)
    (empty left drone1)
    (empty right drone1)
)

(:goal (and
    (has-content person1 food)
    (has-content person1 medicine)
    (has-content person2 food)
    (at-drone drone1 depot)
))
)
