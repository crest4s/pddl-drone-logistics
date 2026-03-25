(define (problem drone_problem_d1_r0_l7_p7_c7_g7_ct2)
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
	loc7 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	crate7 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
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
	(at-box crate7 depot)
	(available crate7)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(at-person person1 loc4)
	(at-person person2 loc2)
	(at-person person3 loc5)
	(at-person person4 loc3)
	(at-person person5 loc1)
	(at-person person6 loc1)
	(at-person person7 loc3)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 202)
	(= (fly-cost depot loc2) 36)
	(= (fly-cost depot loc3) 149)
	(= (fly-cost depot loc4) 90)
	(= (fly-cost depot loc5) 118)
	(= (fly-cost depot loc6) 131)
	(= (fly-cost depot loc7) 181)
	(= (fly-cost loc1 depot) 202)
	(= (fly-cost loc1 loc2) 169)
	(= (fly-cost loc1 loc3) 63)
	(= (fly-cost loc1 loc4) 117)
	(= (fly-cost loc1 loc5) 186)
	(= (fly-cost loc1 loc6) 154)
	(= (fly-cost loc1 loc7) 54)
	(= (fly-cost loc2 depot) 36)
	(= (fly-cost loc2 loc1) 169)
	(= (fly-cost loc2 loc3) 121)
	(= (fly-cost loc2 loc4) 64)
	(= (fly-cost loc2 loc5) 96)
	(= (fly-cost loc2 loc6) 102)
	(= (fly-cost loc2 loc7) 146)
	(= (fly-cost loc3 depot) 149)
	(= (fly-cost loc3 loc1) 63)
	(= (fly-cost loc3 loc2) 121)
	(= (fly-cost loc3 loc4) 60)
	(= (fly-cost loc3 loc5) 167)
	(= (fly-cost loc3 loc6) 142)
	(= (fly-cost loc3 loc7) 81)
	(= (fly-cost loc4 depot) 90)
	(= (fly-cost loc4 loc1) 117)
	(= (fly-cost loc4 loc2) 64)
	(= (fly-cost loc4 loc3) 60)
	(= (fly-cost loc4 loc5) 134)
	(= (fly-cost loc4 loc6) 121)
	(= (fly-cost loc4 loc7) 112)
	(= (fly-cost loc5 depot) 118)
	(= (fly-cost loc5 loc1) 186)
	(= (fly-cost loc5 loc2) 96)
	(= (fly-cost loc5 loc3) 167)
	(= (fly-cost loc5 loc4) 134)
	(= (fly-cost loc5 loc6) 37)
	(= (fly-cost loc5 loc7) 139)
	(= (fly-cost loc6 depot) 131)
	(= (fly-cost loc6 loc1) 154)
	(= (fly-cost loc6 loc2) 102)
	(= (fly-cost loc6 loc3) 142)
	(= (fly-cost loc6 loc4) 121)
	(= (fly-cost loc6 loc5) 37)
	(= (fly-cost loc6 loc7) 105)
	(= (fly-cost loc7 depot) 181)
	(= (fly-cost loc7 loc1) 54)
	(= (fly-cost loc7 loc2) 146)
	(= (fly-cost loc7 loc3) 81)
	(= (fly-cost loc7 loc4) 112)
	(= (fly-cost loc7 loc5) 139)
	(= (fly-cost loc7 loc6) 105)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person3 medicine)
	(has-content person4 food)
	(has-content person5 medicine)
	(has-content person6 medicine)
	(has-content person7 food)
	(has-content person7 medicine)
	))
(:metric minimize (total-cost))
)
