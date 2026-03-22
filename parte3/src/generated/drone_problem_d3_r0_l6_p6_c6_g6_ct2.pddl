(define (problem drone_problem_d3_r0_l6_p6_c6_g6_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
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
	transporter2 - transporter
	transporter3 - transporter
	num0 - num
	num1 - num
	num2 - num
	num3 - num
	num4 - num
)
(:init
	(at-drone drone1 depot)
	(free-drone drone1)
	(at-drone drone2 depot)
	(free-drone drone2)
	(at-drone drone3 depot)
	(free-drone drone3)
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
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(at-person person1 loc5)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-person person3 loc4)
	(free-person person3)
	(at-person person4 loc6)
	(free-person person4)
	(at-person person5 loc2)
	(free-person person5)
	(at-person person6 loc4)
	(free-person person6)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(free-transporter transporter1)
	(at-transporter transporter2 depot)
	(transporter-count transporter2 num0)
	(free-transporter transporter2)
	(at-transporter transporter3 depot)
	(transporter-count transporter3 num0)
	(free-transporter transporter3)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 176)
	(= (fly-cost depot loc2) 118)
	(= (fly-cost depot loc3) 248)
	(= (fly-cost depot loc4) 82)
	(= (fly-cost depot loc5) 125)
	(= (fly-cost depot loc6) 36)
	(= (fly-cost loc1 depot) 176)
	(= (fly-cost loc1 loc2) 93)
	(= (fly-cost loc1 loc3) 99)
	(= (fly-cost loc1 loc4) 105)
	(= (fly-cost loc1 loc5) 84)
	(= (fly-cost loc1 loc6) 145)
	(= (fly-cost loc2 depot) 118)
	(= (fly-cost loc2 loc1) 93)
	(= (fly-cost loc2 loc3) 133)
	(= (fly-cost loc2 loc4) 38)
	(= (fly-cost loc2 loc5) 10)
	(= (fly-cost loc2 loc6) 101)
	(= (fly-cost loc3 depot) 248)
	(= (fly-cost loc3 loc1) 99)
	(= (fly-cost loc3 loc2) 133)
	(= (fly-cost loc3 loc4) 166)
	(= (fly-cost loc3 loc5) 125)
	(= (fly-cost loc3 loc6) 223)
	(= (fly-cost loc4 depot) 82)
	(= (fly-cost loc4 loc1) 105)
	(= (fly-cost loc4 loc2) 38)
	(= (fly-cost loc4 loc3) 166)
	(= (fly-cost loc4 loc5) 43)
	(= (fly-cost loc4 loc6) 64)
	(= (fly-cost loc5 depot) 125)
	(= (fly-cost loc5 loc1) 84)
	(= (fly-cost loc5 loc2) 10)
	(= (fly-cost loc5 loc3) 125)
	(= (fly-cost loc5 loc4) 43)
	(= (fly-cost loc5 loc6) 106)
	(= (fly-cost loc6 depot) 36)
	(= (fly-cost loc6 loc1) 145)
	(= (fly-cost loc6 loc2) 101)
	(= (fly-cost loc6 loc3) 223)
	(= (fly-cost loc6 loc4) 64)
	(= (fly-cost loc6 loc5) 106)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(has-content person1 medicine)
	(has-content person3 food)
	(has-content person4 medicine)
	(has-content person5 food)
	(has-content person6 food)
	(has-content person6 medicine)
	))
(:metric minimize (total-time))
)
