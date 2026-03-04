(define (problem problem2)
(:domain drone-domain)
(:objects
    depot loc1 loc2 - location
    drone1 - drone
    box1 box2 box3 - box
    person1 person2 - person
    food medicine - content
    transporter1 - transporter
    num0 num1 num2 num3 num4 - num
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
    (free-drone drone1)
    (at-transporter transporter1 depot)
    (transporter-count transporter1 num0)
    (siguiente num0 num1)
    (siguiente num1 num2)
    (siguiente num2 num3)
    (siguiente num3 num4)
    (= (total-cost) 0)
    (= (fly-cost depot loc1) 10)
    (= (fly-cost loc1 loc2) 15)
    (= (fly-cost depot loc2) 20)
)

(:goal (and
    (has-content person1 food)
    (has-content person1 medicine)
    (has-content person2 food)
    (at-drone drone1 depot)
))

(:metric minimize (total-cost))
)
