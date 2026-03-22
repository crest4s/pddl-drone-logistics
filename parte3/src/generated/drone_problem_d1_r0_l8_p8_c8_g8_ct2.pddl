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
	(at-box crate7 depot)
	(available crate7)
	(free-box crate7)
	(at-box crate8 depot)
	(available crate8)
	(free-box crate8)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(at-person person1 loc2)
	(free-person person1)
	(at-person person2 loc1)
	(free-person person2)
	(at-person person3 loc8)
	(free-person person3)
	(at-person person4 loc3)
	(free-person person4)
	(at-person person5 loc7)
	(free-person person5)
	(at-person person6 loc1)
	(free-person person6)
	(at-person person7 loc8)
	(free-person person7)
	(at-person person8 loc6)
	(free-person person8)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(free-transporter transporter1)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 180)
	(= (fly-cost depot loc2) 266)
	(= (fly-cost depot loc3) 169)
	(= (fly-cost depot loc4) 200)
	(= (fly-cost depot loc5) 200)
	(= (fly-cost depot loc6) 163)
	(= (fly-cost depot loc7) 139)
	(= (fly-cost depot loc8) 185)
	(= (fly-cost loc1 depot) 180)
	(= (fly-cost loc1 loc2) 154)
	(= (fly-cost loc1 loc3) 115)
	(= (fly-cost loc1 loc4) 207)
	(= (fly-cost loc1 loc5) 55)
	(= (fly-cost loc1 loc6) 106)
	(= (fly-cost loc1 loc7) 164)
	(= (fly-cost loc1 loc8) 37)
	(= (fly-cost loc2 depot) 266)
	(= (fly-cost loc2 loc1) 154)
	(= (fly-cost loc2 loc3) 98)
	(= (fly-cost loc2 loc4) 143)
	(= (fly-cost loc2 loc5) 100)
	(= (fly-cost loc2 loc6) 104)
	(= (fly-cost loc2 loc7) 154)
	(= (fly-cost loc2 loc8) 119)
	(= (fly-cost loc3 depot) 169)
	(= (fly-cost loc3 loc1) 115)
	(= (fly-cost loc3 loc2) 98)
	(= (fly-cost loc3 loc4) 93)
	(= (fly-cost loc3 loc5) 79)
	(= (fly-cost loc3 loc6) 11)
	(= (fly-cost loc3 loc7) 67)
	(= (fly-cost loc3 loc8) 83)
	(= (fly-cost loc4 depot) 200)
	(= (fly-cost loc4 loc1) 207)
	(= (fly-cost loc4 loc2) 143)
	(= (fly-cost loc4 loc3) 93)
	(= (fly-cost loc4 loc5) 170)
	(= (fly-cost loc4 loc6) 101)
	(= (fly-cost loc4 loc7) 64)
	(= (fly-cost loc4 loc8) 176)
	(= (fly-cost loc5 depot) 200)
	(= (fly-cost loc5 loc1) 55)
	(= (fly-cost loc5 loc2) 100)
	(= (fly-cost loc5 loc3) 79)
	(= (fly-cost loc5 loc4) 170)
	(= (fly-cost loc5 loc6) 74)
	(= (fly-cost loc5 loc7) 141)
	(= (fly-cost loc5 loc8) 20)
	(= (fly-cost loc6 depot) 163)
	(= (fly-cost loc6 loc1) 106)
	(= (fly-cost loc6 loc2) 104)
	(= (fly-cost loc6 loc3) 11)
	(= (fly-cost loc6 loc4) 101)
	(= (fly-cost loc6 loc5) 74)
	(= (fly-cost loc6 loc7) 69)
	(= (fly-cost loc6 loc8) 76)
	(= (fly-cost loc7 depot) 139)
	(= (fly-cost loc7 loc1) 164)
	(= (fly-cost loc7 loc2) 154)
	(= (fly-cost loc7 loc3) 67)
	(= (fly-cost loc7 loc4) 64)
	(= (fly-cost loc7 loc5) 141)
	(= (fly-cost loc7 loc6) 69)
	(= (fly-cost loc7 loc8) 140)
	(= (fly-cost loc8 depot) 185)
	(= (fly-cost loc8 loc1) 37)
	(= (fly-cost loc8 loc2) 119)
	(= (fly-cost loc8 loc3) 83)
	(= (fly-cost loc8 loc4) 176)
	(= (fly-cost loc8 loc5) 20)
	(= (fly-cost loc8 loc6) 76)
	(= (fly-cost loc8 loc7) 140)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person4 medicine)
	(has-content person5 medicine)
	(has-content person6 medicine)
	(has-content person7 food)
	(has-content person8 medicine)
	))
(:metric minimize (total-time))
)
