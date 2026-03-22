(define (problem drone_problem_d2_r0_l8_p8_c8_g8_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
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
	transporter2 - transporter
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
	(box-content crate4 food)
	(box-content crate5 food)
	(box-content crate6 food)
	(box-content crate7 food)
	(box-content crate8 medicine)
	(at-person person1 loc3)
	(free-person person1)
	(at-person person2 loc3)
	(free-person person2)
	(at-person person3 loc2)
	(free-person person3)
	(at-person person4 loc3)
	(free-person person4)
	(at-person person5 loc8)
	(free-person person5)
	(at-person person6 loc3)
	(free-person person6)
	(at-person person7 loc4)
	(free-person person7)
	(at-person person8 loc5)
	(free-person person8)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(free-transporter transporter1)
	(at-transporter transporter2 depot)
	(transporter-count transporter2 num0)
	(free-transporter transporter2)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 187)
	(= (fly-cost depot loc2) 106)
	(= (fly-cost depot loc3) 91)
	(= (fly-cost depot loc4) 122)
	(= (fly-cost depot loc5) 108)
	(= (fly-cost depot loc6) 171)
	(= (fly-cost depot loc7) 172)
	(= (fly-cost depot loc8) 185)
	(= (fly-cost loc1 depot) 187)
	(= (fly-cost loc1 loc2) 109)
	(= (fly-cost loc1 loc3) 114)
	(= (fly-cost loc1 loc4) 155)
	(= (fly-cost loc1 loc5) 111)
	(= (fly-cost loc1 loc6) 129)
	(= (fly-cost loc1 loc7) 22)
	(= (fly-cost loc1 loc8) 158)
	(= (fly-cost loc2 depot) 106)
	(= (fly-cost loc2 loc1) 109)
	(= (fly-cost loc2 loc3) 94)
	(= (fly-cost loc2 loc4) 53)
	(= (fly-cost loc2 loc5) 109)
	(= (fly-cost loc2 loc6) 72)
	(= (fly-cost loc2 loc7) 88)
	(= (fly-cost loc2 loc8) 94)
	(= (fly-cost loc3 depot) 91)
	(= (fly-cost loc3 loc1) 114)
	(= (fly-cost loc3 loc2) 94)
	(= (fly-cost loc3 loc4) 142)
	(= (fly-cost loc3 loc5) 19)
	(= (fly-cost loc3 loc6) 162)
	(= (fly-cost loc3 loc7) 106)
	(= (fly-cost loc3 loc8) 187)
	(= (fly-cost loc4 depot) 122)
	(= (fly-cost loc4 loc1) 155)
	(= (fly-cost loc4 loc2) 53)
	(= (fly-cost loc4 loc3) 142)
	(= (fly-cost loc4 loc5) 158)
	(= (fly-cost loc4 loc6) 61)
	(= (fly-cost loc4 loc7) 133)
	(= (fly-cost loc4 loc8) 65)
	(= (fly-cost loc5 depot) 108)
	(= (fly-cost loc5 loc1) 111)
	(= (fly-cost loc5 loc2) 109)
	(= (fly-cost loc5 loc3) 19)
	(= (fly-cost loc5 loc4) 158)
	(= (fly-cost loc5 loc6) 174)
	(= (fly-cost loc5 loc7) 106)
	(= (fly-cost loc5 loc8) 200)
	(= (fly-cost loc6 depot) 171)
	(= (fly-cost loc6 loc1) 129)
	(= (fly-cost loc6 loc2) 72)
	(= (fly-cost loc6 loc3) 162)
	(= (fly-cost loc6 loc4) 61)
	(= (fly-cost loc6 loc5) 174)
	(= (fly-cost loc6 loc7) 110)
	(= (fly-cost loc6 loc8) 30)
	(= (fly-cost loc7 depot) 172)
	(= (fly-cost loc7 loc1) 22)
	(= (fly-cost loc7 loc2) 88)
	(= (fly-cost loc7 loc3) 106)
	(= (fly-cost loc7 loc4) 133)
	(= (fly-cost loc7 loc5) 106)
	(= (fly-cost loc7 loc6) 110)
	(= (fly-cost loc7 loc8) 139)
	(= (fly-cost loc8 depot) 185)
	(= (fly-cost loc8 loc1) 158)
	(= (fly-cost loc8 loc2) 94)
	(= (fly-cost loc8 loc3) 187)
	(= (fly-cost loc8 loc4) 65)
	(= (fly-cost loc8 loc5) 200)
	(= (fly-cost loc8 loc6) 30)
	(= (fly-cost loc8 loc7) 139)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(has-content person1 food)
	(has-content person2 food)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person5 food)
	(has-content person5 medicine)
	(has-content person6 food)
	(has-content person7 food)
	))
(:metric minimize (total-time))
)
