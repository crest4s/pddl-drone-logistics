(define (problem drone_problem_d1_r0_l6_p6_c6_g6_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	loc6 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	transporter1 - transporter
	num0 - num
	num1 - num
	num2 - num
	num3 - num
	num4 - num
)
(:init
	(at-drone drone1 depot)
	(free-drone drone1)
	(at-box crate1 depot)
	(available crate1)
	(free-box crate1)
	(at-box crate2 depot)
	(available crate2)
	(free-box crate2)
	(at-box crate3 depot)
	(available crate3)
	(free-box crate3)
	(at-box crate4 depot)
	(available crate4)
	(free-box crate4)
	(at-box crate5 depot)
	(available crate5)
	(free-box crate5)
	(at-box crate6 depot)
	(available crate6)
	(free-box crate6)
	(box-content crate1 food)
	(box-content crate2 medicine)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(at-person person1 loc1)
	(free-person person1)
	(at-person person2 loc1)
	(free-person person2)
	(at-person person3 loc4)
	(free-person person3)
	(at-person person4 loc2)
	(free-person person4)
	(at-person person5 loc3)
	(free-person person5)
	(at-person person6 loc3)
	(free-person person6)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(free-transporter transporter1)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 93)
	(= (fly-cost depot loc2) 207)
	(= (fly-cost depot loc3) 115)
	(= (fly-cost depot loc4) 180)
	(= (fly-cost depot loc5) 72)
	(= (fly-cost depot loc6) 190)
	(= (fly-cost loc1 depot) 93)
	(= (fly-cost loc1 loc2) 122)
	(= (fly-cost loc1 loc3) 30)
	(= (fly-cost loc1 loc4) 107)
	(= (fly-cost loc1 loc5) 23)
	(= (fly-cost loc1 loc6) 98)
	(= (fly-cost loc2 depot) 207)
	(= (fly-cost loc2 loc1) 122)
	(= (fly-cost loc2 loc3) 94)
	(= (fly-cost loc2 loc4) 44)
	(= (fly-cost loc2 loc5) 145)
	(= (fly-cost loc2 loc6) 61)
	(= (fly-cost loc3 depot) 115)
	(= (fly-cost loc3 loc1) 30)
	(= (fly-cost loc3 loc2) 94)
	(= (fly-cost loc3 loc4) 78)
	(= (fly-cost loc3 loc5) 51)
	(= (fly-cost loc3 loc6) 80)
	(= (fly-cost loc4 depot) 180)
	(= (fly-cost loc4 loc1) 107)
	(= (fly-cost loc4 loc2) 44)
	(= (fly-cost loc4 loc3) 78)
	(= (fly-cost loc4 loc5) 127)
	(= (fly-cost loc4 loc6) 87)
	(= (fly-cost loc5 depot) 72)
	(= (fly-cost loc5 loc1) 23)
	(= (fly-cost loc5 loc2) 145)
	(= (fly-cost loc5 loc3) 51)
	(= (fly-cost loc5 loc4) 127)
	(= (fly-cost loc5 loc6) 120)
	(= (fly-cost loc6 depot) 190)
	(= (fly-cost loc6 loc1) 98)
	(= (fly-cost loc6 loc2) 61)
	(= (fly-cost loc6 loc3) 80)
	(= (fly-cost loc6 loc4) 87)
	(= (fly-cost loc6 loc5) 120)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person4 medicine)
	(has-content person5 medicine)
	(has-content person6 medicine)
	))
(:metric minimize (total-time))
)
