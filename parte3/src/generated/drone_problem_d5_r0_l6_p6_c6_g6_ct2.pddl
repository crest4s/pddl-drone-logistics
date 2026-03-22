(define (problem drone_problem_d5_r0_l6_p6_c6_g6_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
	drone4 - drone
	drone5 - drone
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
	transporter4 - transporter
	transporter5 - transporter
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
	(at-drone drone4 depot)
	(free-drone drone4)
	(at-drone drone5 depot)
	(free-drone drone5)
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
	(at-person person1 loc4)
	(free-person person1)
	(at-person person2 loc4)
	(free-person person2)
	(at-person person3 loc3)
	(free-person person3)
	(at-person person4 loc4)
	(free-person person4)
	(at-person person5 loc3)
	(free-person person5)
	(at-person person6 loc5)
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
	(at-transporter transporter4 depot)
	(transporter-count transporter4 num0)
	(free-transporter transporter4)
	(at-transporter transporter5 depot)
	(transporter-count transporter5 num0)
	(free-transporter transporter5)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 64)
	(= (fly-cost depot loc2) 226)
	(= (fly-cost depot loc3) 165)
	(= (fly-cost depot loc4) 179)
	(= (fly-cost depot loc5) 168)
	(= (fly-cost depot loc6) 127)
	(= (fly-cost loc1 depot) 64)
	(= (fly-cost loc1 loc2) 171)
	(= (fly-cost loc1 loc3) 111)
	(= (fly-cost loc1 loc4) 118)
	(= (fly-cost loc1 loc5) 111)
	(= (fly-cost loc1 loc6) 67)
	(= (fly-cost loc2 depot) 226)
	(= (fly-cost loc2 loc1) 171)
	(= (fly-cost loc2 loc3) 172)
	(= (fly-cost loc2 loc4) 129)
	(= (fly-cost loc2 loc5) 60)
	(= (fly-cost loc2 loc6) 150)
	(= (fly-cost loc3 depot) 165)
	(= (fly-cost loc3 loc1) 111)
	(= (fly-cost loc3 loc2) 172)
	(= (fly-cost loc3 loc4) 46)
	(= (fly-cost loc3 loc5) 127)
	(= (fly-cost loc3 loc6) 47)
	(= (fly-cost loc4 depot) 179)
	(= (fly-cost loc4 loc1) 118)
	(= (fly-cost loc4 loc2) 129)
	(= (fly-cost loc4 loc3) 46)
	(= (fly-cost loc4 loc5) 92)
	(= (fly-cost loc4 loc6) 54)
	(= (fly-cost loc5 depot) 168)
	(= (fly-cost loc5 loc1) 111)
	(= (fly-cost loc5 loc2) 60)
	(= (fly-cost loc5 loc3) 127)
	(= (fly-cost loc5 loc4) 92)
	(= (fly-cost loc5 loc6) 95)
	(= (fly-cost loc6 depot) 127)
	(= (fly-cost loc6 loc1) 67)
	(= (fly-cost loc6 loc2) 150)
	(= (fly-cost loc6 loc3) 47)
	(= (fly-cost loc6 loc4) 54)
	(= (fly-cost loc6 loc5) 95)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person3 food)
	(has-content person4 medicine)
	(has-content person5 medicine)
	(has-content person6 food)
	))
(:metric minimize (total-time))
)
