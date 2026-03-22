(define (problem drone_problem_d3_r0_l8_p8_c8_g8_ct2)
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
	(at-box crate7 depot)
	(available crate7)
	(free-box crate7)
	(at-box crate8 depot)
	(available crate8)
	(free-box crate8)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(at-person person1 loc6)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-person person3 loc1)
	(free-person person3)
	(at-person person4 loc5)
	(free-person person4)
	(at-person person5 loc4)
	(free-person person5)
	(at-person person6 loc7)
	(free-person person6)
	(at-person person7 loc1)
	(free-person person7)
	(at-person person8 loc7)
	(free-person person8)
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
	(= (fly-cost depot loc1) 81)
	(= (fly-cost depot loc2) 95)
	(= (fly-cost depot loc3) 45)
	(= (fly-cost depot loc4) 152)
	(= (fly-cost depot loc5) 216)
	(= (fly-cost depot loc6) 252)
	(= (fly-cost depot loc7) 80)
	(= (fly-cost depot loc8) 160)
	(= (fly-cost loc1 depot) 81)
	(= (fly-cost loc1 loc2) 54)
	(= (fly-cost loc1 loc3) 37)
	(= (fly-cost loc1 loc4) 71)
	(= (fly-cost loc1 loc5) 135)
	(= (fly-cost loc1 loc6) 173)
	(= (fly-cost loc1 loc7) 56)
	(= (fly-cost loc1 loc8) 125)
	(= (fly-cost loc2 depot) 95)
	(= (fly-cost loc2 loc1) 54)
	(= (fly-cost loc2 loc3) 64)
	(= (fly-cost loc2 loc4) 95)
	(= (fly-cost loc2 loc5) 156)
	(= (fly-cost loc2 loc6) 170)
	(= (fly-cost loc2 loc7) 18)
	(= (fly-cost loc2 loc8) 74)
	(= (fly-cost loc3 depot) 45)
	(= (fly-cost loc3 loc1) 37)
	(= (fly-cost loc3 loc2) 64)
	(= (fly-cost loc3 loc4) 107)
	(= (fly-cost loc3 loc5) 171)
	(= (fly-cost loc3 loc6) 208)
	(= (fly-cost loc3 loc7) 55)
	(= (fly-cost loc3 loc8) 136)
	(= (fly-cost loc4 depot) 152)
	(= (fly-cost loc4 loc1) 71)
	(= (fly-cost loc4 loc2) 95)
	(= (fly-cost loc4 loc3) 107)
	(= (fly-cost loc4 loc5) 65)
	(= (fly-cost loc4 loc6) 110)
	(= (fly-cost loc4 loc7) 108)
	(= (fly-cost loc4 loc8) 139)
	(= (fly-cost loc5 depot) 216)
	(= (fly-cost loc5 loc1) 135)
	(= (fly-cost loc5 loc2) 156)
	(= (fly-cost loc5 loc3) 171)
	(= (fly-cost loc5 loc4) 65)
	(= (fly-cost loc5 loc6) 75)
	(= (fly-cost loc5 loc7) 170)
	(= (fly-cost loc5 loc8) 183)
	(= (fly-cost loc6 depot) 252)
	(= (fly-cost loc6 loc1) 173)
	(= (fly-cost loc6 loc2) 170)
	(= (fly-cost loc6 loc3) 208)
	(= (fly-cost loc6 loc4) 110)
	(= (fly-cost loc6 loc5) 75)
	(= (fly-cost loc6 loc7) 187)
	(= (fly-cost loc6 loc8) 165)
	(= (fly-cost loc7 depot) 80)
	(= (fly-cost loc7 loc1) 56)
	(= (fly-cost loc7 loc2) 18)
	(= (fly-cost loc7 loc3) 55)
	(= (fly-cost loc7 loc4) 108)
	(= (fly-cost loc7 loc5) 170)
	(= (fly-cost loc7 loc6) 187)
	(= (fly-cost loc7 loc8) 83)
	(= (fly-cost loc8 depot) 160)
	(= (fly-cost loc8 loc1) 125)
	(= (fly-cost loc8 loc2) 74)
	(= (fly-cost loc8 loc3) 136)
	(= (fly-cost loc8 loc4) 139)
	(= (fly-cost loc8 loc5) 183)
	(= (fly-cost loc8 loc6) 165)
	(= (fly-cost loc8 loc7) 83)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(has-content person1 medicine)
	(has-content person2 medicine)
	(has-content person3 food)
	(has-content person5 medicine)
	(has-content person6 medicine)
	(has-content person7 food)
	(has-content person7 medicine)
	(has-content person8 medicine)
	))
(:metric minimize (total-time))
)
