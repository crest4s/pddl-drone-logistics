(define (problem problem2)
(:domain drone-domain)
(:objects
    depot loc1 loc2 - location
    drone1 - drone
    crate1 crate2 crate3 - box
    person1 person2 - person
    food medicine - content
)

(:init
    (at-drone drone1 depot)
    (at-box crate1 depot)
    (at-box crate2 depot)
    (at-box crate3 depot)
    (at-person person1 loc1)
    (at-person person2 loc2)
    (box-content crate1 food)
    (box-content crate2 medicine)
    (box-content crate3 food)
    (empty-left drone1)
    (empty-right drone1)
)

(:goal (and
    (has-content person1 food)
    (has-content person1 medicine)
    (has-content person2 food)
    (at-drone drone1 depot)
))
)
