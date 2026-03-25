(define (problem drone_problem_d1_r0_l9_p9_c9_g9_ct2)
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
	loc8 - location
	loc9 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	crate7 - box
	crate8 - box
	crate9 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
	person9 - person
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
	(at-box crate8 depot)
	(available crate8)
	(at-box crate9 depot)
	(available crate9)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(box-content crate9 medicine)
	(at-person person1 loc4)
	(at-person person2 loc2)
	(at-person person3 loc6)
	(at-person person4 loc4)
	(at-person person5 loc1)
	(at-person person6 loc5)
	(at-person person7 loc3)
	(at-person person8 loc3)
	(at-person person9 loc1)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 194)
	(= (fly-cost depot loc2) 145)
	(= (fly-cost depot loc3) 162)
	(= (fly-cost depot loc4) 206)
	(= (fly-cost depot loc5) 238)
	(= (fly-cost depot loc6) 54)
	(= (fly-cost depot loc7) 61)
	(= (fly-cost depot loc8) 185)
	(= (fly-cost depot loc9) 33)
	(= (fly-cost loc1 depot) 194)
	(= (fly-cost loc1 loc2) 77)
	(= (fly-cost loc1 loc3) 162)
	(= (fly-cost loc1 loc4) 111)
	(= (fly-cost loc1 loc5) 78)
	(= (fly-cost loc1 loc6) 147)
	(= (fly-cost loc1 loc7) 147)
	(= (fly-cost loc1 loc8) 143)
	(= (fly-cost loc1 loc9) 164)
	(= (fly-cost loc2 depot) 145)
	(= (fly-cost loc2 loc1) 77)
	(= (fly-cost loc2 loc3) 184)
	(= (fly-cost loc2 loc4) 164)
	(= (fly-cost loc2 loc5) 151)
	(= (fly-cost loc2 loc6) 92)
	(= (fly-cost loc2 loc7) 119)
	(= (fly-cost loc2 loc8) 179)
	(= (fly-cost loc2 loc9) 122)
	(= (fly-cost loc3 depot) 162)
	(= (fly-cost loc3 loc1) 162)
	(= (fly-cost loc3 loc2) 184)
	(= (fly-cost loc3 loc4) 80)
	(= (fly-cost loc3 loc5) 143)
	(= (fly-cost loc3 loc6) 159)
	(= (fly-cost loc3 loc7) 107)
	(= (fly-cost loc3 loc8) 35)
	(= (fly-cost loc3 loc9) 137)
	(= (fly-cost loc4 depot) 206)
	(= (fly-cost loc4 loc1) 111)
	(= (fly-cost loc4 loc2) 164)
	(= (fly-cost loc4 loc3) 80)
	(= (fly-cost loc4 loc5) 66)
	(= (fly-cost loc4 loc6) 182)
	(= (fly-cost loc4 loc7) 145)
	(= (fly-cost loc4 loc8) 47)
	(= (fly-cost loc4 loc9) 174)
	(= (fly-cost loc5 depot) 238)
	(= (fly-cost loc5 loc1) 78)
	(= (fly-cost loc5 loc2) 151)
	(= (fly-cost loc5 loc3) 143)
	(= (fly-cost loc5 loc4) 66)
	(= (fly-cost loc5 loc6) 201)
	(= (fly-cost loc5 loc7) 180)
	(= (fly-cost loc5 loc8) 112)
	(= (fly-cost loc5 loc9) 205)
	(= (fly-cost loc6 depot) 54)
	(= (fly-cost loc6 loc1) 147)
	(= (fly-cost loc6 loc2) 92)
	(= (fly-cost loc6 loc3) 159)
	(= (fly-cost loc6 loc4) 182)
	(= (fly-cost loc6 loc5) 201)
	(= (fly-cost loc6 loc7) 56)
	(= (fly-cost loc6 loc8) 173)
	(= (fly-cost loc6 loc9) 37)
	(= (fly-cost loc7 depot) 61)
	(= (fly-cost loc7 loc1) 147)
	(= (fly-cost loc7 loc2) 119)
	(= (fly-cost loc7 loc3) 107)
	(= (fly-cost loc7 loc4) 145)
	(= (fly-cost loc7 loc5) 180)
	(= (fly-cost loc7 loc6) 56)
	(= (fly-cost loc7 loc8) 126)
	(= (fly-cost loc7 loc9) 31)
	(= (fly-cost loc8 depot) 185)
	(= (fly-cost loc8 loc1) 143)
	(= (fly-cost loc8 loc2) 179)
	(= (fly-cost loc8 loc3) 35)
	(= (fly-cost loc8 loc4) 47)
	(= (fly-cost loc8 loc5) 112)
	(= (fly-cost loc8 loc6) 173)
	(= (fly-cost loc8 loc7) 126)
	(= (fly-cost loc8 loc9) 156)
	(= (fly-cost loc9 depot) 33)
	(= (fly-cost loc9 loc1) 164)
	(= (fly-cost loc9 loc2) 122)
	(= (fly-cost loc9 loc3) 137)
	(= (fly-cost loc9 loc4) 174)
	(= (fly-cost loc9 loc5) 205)
	(= (fly-cost loc9 loc6) 37)
	(= (fly-cost loc9 loc7) 31)
	(= (fly-cost loc9 loc8) 156)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person1 medicine)
	(has-content person3 food)
	(has-content person3 medicine)
	(has-content person4 medicine)
	(has-content person5 medicine)
	(has-content person6 medicine)
	(has-content person7 medicine)
	(has-content person9 medicine)
	))
(:metric minimize (total-cost))
)
