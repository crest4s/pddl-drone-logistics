(define (problem problem1)
(:domain drone-domain)
(:objects
    depot loc1 - location
    drone1 - drone
    crate1 - box
    person1 - person
    food - content
)

(:init
    (at-drone drone1 depot)
    (at-box crate1 depot)
    (at-person person1 loc1)
    (box-content crate1 food)
    (empty-left drone1)
    (empty-right drone1)
)

(:goal (and
    (has-content person1 food)
    (at-drone drone1 depot)
))
)
