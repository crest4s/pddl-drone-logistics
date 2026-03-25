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
	(at-box crate2 depot)
	(available crate2)
	(at-box crate3 depot)
	(available crate3)
	(at-box crate4 depot)
	(available crate4)
	(at-box crate5 depot)
	(available crate5)
	(at-box crate6 depot)
	(available crate6)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(at-person person1 loc4)
	(at-person person2 loc3)
	(at-person person3 loc3)
	(at-person person4 loc4)
	(at-person person5 loc5)
	(at-person person6 loc6)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 78)
	(= (fly-cost depot loc2) 200)
	(= (fly-cost depot loc3) 159)
	(= (fly-cost depot loc4) 120)
	(= (fly-cost depot loc5) 133)
	(= (fly-cost depot loc6) 200)
	(= (fly-cost loc1 depot) 78)
	(= (fly-cost loc1 loc2) 162)
	(= (fly-cost loc1 loc3) 106)
	(= (fly-cost loc1 loc4) 63)
	(= (fly-cost loc1 loc5) 116)
	(= (fly-cost loc1 loc6) 130)
	(= (fly-cost loc2 depot) 200)
	(= (fly-cost loc2 loc1) 162)
	(= (fly-cost loc2 loc3) 62)
	(= (fly-cost loc2 loc4) 101)
	(= (fly-cost loc2 loc5) 74)
	(= (fly-cost loc2 loc6) 232)
	(= (fly-cost loc3 depot) 159)
	(= (fly-cost loc3 loc1) 106)
	(= (fly-cost loc3 loc2) 62)
	(= (fly-cost loc3 loc4) 44)
	(= (fly-cost loc3 loc5) 68)
	(= (fly-cost loc3 loc6) 173)
	(= (fly-cost loc4 depot) 120)
	(= (fly-cost loc4 loc1) 63)
	(= (fly-cost loc4 loc2) 101)
	(= (fly-cost loc4 loc3) 44)
	(= (fly-cost loc4 loc5) 72)
	(= (fly-cost loc4 loc6) 150)
	(= (fly-cost loc5 depot) 133)
	(= (fly-cost loc5 loc1) 116)
	(= (fly-cost loc5 loc2) 74)
	(= (fly-cost loc5 loc3) 68)
	(= (fly-cost loc5 loc4) 72)
	(= (fly-cost loc5 loc6) 222)
	(= (fly-cost loc6 depot) 200)
	(= (fly-cost loc6 loc1) 130)
	(= (fly-cost loc6 loc2) 232)
	(= (fly-cost loc6 loc3) 173)
	(= (fly-cost loc6 loc4) 150)
	(= (fly-cost loc6 loc5) 222)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person2 medicine)
	(has-content person4 food)
	(has-content person4 medicine)
	(has-content person5 food)
	(has-content person5 medicine)
	))
(:metric minimize (total-cost))
)
