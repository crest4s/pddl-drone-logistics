(define (problem drone_problem_d5_r0_l8_p8_c8_g8_ct2)
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
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(at-person person1 loc6)
	(free-person person1)
	(at-person person2 loc8)
	(free-person person2)
	(at-person person3 loc2)
	(free-person person3)
	(at-person person4 loc3)
	(free-person person4)
	(at-person person5 loc6)
	(free-person person5)
	(at-person person6 loc4)
	(free-person person6)
	(at-person person7 loc5)
	(free-person person7)
	(at-person person8 loc5)
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
	(= (fly-cost depot loc1) 131)
	(= (fly-cost depot loc2) 99)
	(= (fly-cost depot loc3) 87)
	(= (fly-cost depot loc4) 208)
	(= (fly-cost depot loc5) 176)
	(= (fly-cost depot loc6) 91)
	(= (fly-cost depot loc7) 187)
	(= (fly-cost depot loc8) 150)
	(= (fly-cost loc1 depot) 131)
	(= (fly-cost loc1 loc2) 126)
	(= (fly-cost loc1 loc3) 87)
	(= (fly-cost loc1 loc4) 124)
	(= (fly-cost loc1 loc5) 74)
	(= (fly-cost loc1 loc6) 81)
	(= (fly-cost loc1 loc7) 81)
	(= (fly-cost loc1 loc8) 20)
	(= (fly-cost loc2 depot) 99)
	(= (fly-cost loc2 loc1) 126)
	(= (fly-cost loc2 loc3) 40)
	(= (fly-cost loc2 loc4) 133)
	(= (fly-cost loc2 loc5) 196)
	(= (fly-cost loc2 loc6) 45)
	(= (fly-cost loc2 loc7) 134)
	(= (fly-cost loc2 loc8) 139)
	(= (fly-cost loc3 depot) 87)
	(= (fly-cost loc3 loc1) 87)
	(= (fly-cost loc3 loc2) 40)
	(= (fly-cost loc3 loc4) 122)
	(= (fly-cost loc3 loc5) 157)
	(= (fly-cost loc3 loc6) 7)
	(= (fly-cost loc3 loc7) 110)
	(= (fly-cost loc3 loc8) 101)
	(= (fly-cost loc4 depot) 208)
	(= (fly-cost loc4 loc1) 124)
	(= (fly-cost loc4 loc2) 133)
	(= (fly-cost loc4 loc3) 122)
	(= (fly-cost loc4 loc5) 182)
	(= (fly-cost loc4 loc6) 118)
	(= (fly-cost loc4 loc7) 49)
	(= (fly-cost loc4 loc8) 117)
	(= (fly-cost loc5 depot) 176)
	(= (fly-cost loc5 loc1) 74)
	(= (fly-cost loc5 loc2) 196)
	(= (fly-cost loc5 loc3) 157)
	(= (fly-cost loc5 loc4) 182)
	(= (fly-cost loc5 loc6) 152)
	(= (fly-cost loc5 loc7) 134)
	(= (fly-cost loc5 loc8) 69)
	(= (fly-cost loc6 depot) 91)
	(= (fly-cost loc6 loc1) 81)
	(= (fly-cost loc6 loc2) 45)
	(= (fly-cost loc6 loc3) 7)
	(= (fly-cost loc6 loc4) 118)
	(= (fly-cost loc6 loc5) 152)
	(= (fly-cost loc6 loc7) 104)
	(= (fly-cost loc6 loc8) 95)
	(= (fly-cost loc7 depot) 187)
	(= (fly-cost loc7 loc1) 81)
	(= (fly-cost loc7 loc2) 134)
	(= (fly-cost loc7 loc3) 110)
	(= (fly-cost loc7 loc4) 49)
	(= (fly-cost loc7 loc5) 134)
	(= (fly-cost loc7 loc6) 104)
	(= (fly-cost loc7 loc8) 71)
	(= (fly-cost loc8 depot) 150)
	(= (fly-cost loc8 loc1) 20)
	(= (fly-cost loc8 loc2) 139)
	(= (fly-cost loc8 loc3) 101)
	(= (fly-cost loc8 loc4) 117)
	(= (fly-cost loc8 loc5) 69)
	(= (fly-cost loc8 loc6) 95)
	(= (fly-cost loc8 loc7) 71)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(has-content person1 food)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person5 food)
	(has-content person5 medicine)
	(has-content person6 food)
	(has-content person6 medicine)
	(has-content person7 food)
	))
(:metric minimize (total-time))
)
