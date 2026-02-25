(define (problem problem1)
(:domain drone-domain)
(:objects
    depot loc1 - location
    drone1 - drone
    box1 - box
    person1 - person
    food - content
    transporter1 - transporter
    num0 num1 num2 num3 num4 - num
)

(:init
    (at-drone drone1 depot)
    (at-box box1 depot)
    (at-person person1 loc1)
    (box-content box1 food)
    (free-drone drone1)
    (available box1)
    (at-transporter transporter1 depot)
    (transporter-count transporter1 num0)
    (siguiente num0 num1)
    (siguiente num1 num2)
    (siguiente num2 num3)
    (siguiente num3 num4)
)

(:goal (and
    (has-content person1 food)
    (at-drone drone1 depot)
))
)
