(define (problem drone_problem_d1_r0_l8_p8_c8_g8_ct2)
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
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	crate7 - box
	crate8 - box
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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(at-person person1 loc8)
	(at-person person2 loc3)
	(at-person person3 loc5)
	(at-person person4 loc1)
	(at-person person5 loc7)
	(at-person person6 loc2)
	(at-person person7 loc5)
	(at-person person8 loc5)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 206)
	(= (fly-cost depot loc2) 125)
	(= (fly-cost depot loc3) 222)
	(= (fly-cost depot loc4) 214)
	(= (fly-cost depot loc5) 152)
	(= (fly-cost depot loc6) 261)
	(= (fly-cost depot loc7) 206)
	(= (fly-cost depot loc8) 233)
	(= (fly-cost loc1 depot) 206)
	(= (fly-cost loc1 loc2) 151)
	(= (fly-cost loc1 loc3) 32)
	(= (fly-cost loc1 loc4) 81)
	(= (fly-cost loc1 loc5) 106)
	(= (fly-cost loc1 loc6) 66)
	(= (fly-cost loc1 loc7) 107)
	(= (fly-cost loc1 loc8) 33)
	(= (fly-cost loc2 depot) 125)
	(= (fly-cost loc2 loc1) 151)
	(= (fly-cost loc2 loc3) 148)
	(= (fly-cost loc2 loc4) 113)
	(= (fly-cost loc2 loc5) 49)
	(= (fly-cost loc2 loc6) 179)
	(= (fly-cost loc2 loc7) 94)
	(= (fly-cost loc2 loc8) 163)
	(= (fly-cost loc3 depot) 222)
	(= (fly-cost loc3 loc1) 32)
	(= (fly-cost loc3 loc2) 148)
	(= (fly-cost loc3 loc4) 57)
	(= (fly-cost loc3 loc5) 101)
	(= (fly-cost loc3 loc6) 40)
	(= (fly-cost loc3 loc7) 86)
	(= (fly-cost loc3 loc8) 16)
	(= (fly-cost loc4 depot) 214)
	(= (fly-cost loc4 loc1) 81)
	(= (fly-cost loc4 loc2) 113)
	(= (fly-cost loc4 loc3) 57)
	(= (fly-cost loc4 loc5) 67)
	(= (fly-cost loc4 loc6) 72)
	(= (fly-cost loc4 loc7) 31)
	(= (fly-cost loc4 loc8) 70)
	(= (fly-cost loc5 depot) 152)
	(= (fly-cost loc5 loc1) 106)
	(= (fly-cost loc5 loc2) 49)
	(= (fly-cost loc5 loc3) 101)
	(= (fly-cost loc5 loc4) 67)
	(= (fly-cost loc5 loc6) 131)
	(= (fly-cost loc5 loc7) 55)
	(= (fly-cost loc5 loc8) 115)
	(= (fly-cost loc6 depot) 261)
	(= (fly-cost loc6 loc1) 66)
	(= (fly-cost loc6 loc2) 179)
	(= (fly-cost loc6 loc3) 40)
	(= (fly-cost loc6 loc4) 72)
	(= (fly-cost loc6 loc5) 131)
	(= (fly-cost loc6 loc7) 102)
	(= (fly-cost loc6 loc8) 33)
	(= (fly-cost loc7 depot) 206)
	(= (fly-cost loc7 loc1) 107)
	(= (fly-cost loc7 loc2) 94)
	(= (fly-cost loc7 loc3) 86)
	(= (fly-cost loc7 loc4) 31)
	(= (fly-cost loc7 loc5) 55)
	(= (fly-cost loc7 loc6) 102)
	(= (fly-cost loc7 loc8) 100)
	(= (fly-cost loc8 depot) 233)
	(= (fly-cost loc8 loc1) 33)
	(= (fly-cost loc8 loc2) 163)
	(= (fly-cost loc8 loc3) 16)
	(= (fly-cost loc8 loc4) 70)
	(= (fly-cost loc8 loc5) 115)
	(= (fly-cost loc8 loc6) 33)
	(= (fly-cost loc8 loc7) 100)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person4 medicine)
	(has-content person6 food)
	(has-content person6 medicine)
	(has-content person7 food)
	(has-content person7 medicine)
	))
(:metric minimize (total-cost))
)
