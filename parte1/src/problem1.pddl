(define (problem problem1)
(:domain drone-domain)
(:objects
    depot loc1 - location
    drone1 - drone
    box1 - box
    person1 - person
    food - content
    right left - arm
)

(:init
    (at-drone drone1 depot)
    (at-box box1 depot)
    (at-person person1 loc1)
    (box-content box1 food)
    (empty right drone1)
    (empty left drone1)
    (available box1)
)

(:goal (and
    (has-content person1 food)
    (at-drone drone1 depot)
))
)
