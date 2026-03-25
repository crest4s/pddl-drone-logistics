(define (problem drone_problem_d10_r0_l8_p8_c8_g8_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
	drone4 - drone
	drone5 - drone
	drone6 - drone
	drone7 - drone
	drone8 - drone
	drone9 - drone
	drone10 - drone
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
	transporter6 - transporter
	transporter7 - transporter
	transporter8 - transporter
	transporter9 - transporter
	transporter10 - transporter
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
	(at-drone drone6 depot)
	(free-drone drone6)
	(at-drone drone7 depot)
	(free-drone drone7)
	(at-drone drone8 depot)
	(free-drone drone8)
	(at-drone drone9 depot)
	(free-drone drone9)
	(at-drone drone10 depot)
	(free-drone drone10)
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
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(at-person person1 loc1)
	(free-person person1)
	(at-person person2 loc7)
	(free-person person2)
	(at-person person3 loc4)
	(free-person person3)
	(at-person person4 loc3)
	(free-person person4)
	(at-person person5 loc4)
	(free-person person5)
	(at-person person6 loc6)
	(free-person person6)
	(at-person person7 loc1)
	(free-person person7)
	(at-person person8 loc3)
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
	(at-transporter transporter6 depot)
	(transporter-count transporter6 num0)
	(free-transporter transporter6)
	(at-transporter transporter7 depot)
	(transporter-count transporter7 num0)
	(free-transporter transporter7)
	(at-transporter transporter8 depot)
	(transporter-count transporter8 num0)
	(free-transporter transporter8)
	(at-transporter transporter9 depot)
	(transporter-count transporter9 num0)
	(free-transporter transporter9)
	(at-transporter transporter10 depot)
	(transporter-count transporter10 num0)
	(free-transporter transporter10)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 23)
	(= (fly-cost depot loc2) 202)
	(= (fly-cost depot loc3) 89)
	(= (fly-cost depot loc4) 82)
	(= (fly-cost depot loc5) 157)
	(= (fly-cost depot loc6) 171)
	(= (fly-cost depot loc7) 17)
	(= (fly-cost depot loc8) 189)
	(= (fly-cost loc1 depot) 23)
	(= (fly-cost loc1 loc2) 180)
	(= (fly-cost loc1 loc3) 83)
	(= (fly-cost loc1 loc4) 60)
	(= (fly-cost loc1 loc5) 139)
	(= (fly-cost loc1 loc6) 148)
	(= (fly-cost loc1 loc7) 7)
	(= (fly-cost loc1 loc8) 178)
	(= (fly-cost loc2 depot) 202)
	(= (fly-cost loc2 loc1) 180)
	(= (fly-cost loc2 loc3) 176)
	(= (fly-cost loc2 loc4) 121)
	(= (fly-cost loc2 loc5) 104)
	(= (fly-cost loc2 loc6) 39)
	(= (fly-cost loc2 loc7) 186)
	(= (fly-cost loc2 loc8) 175)
	(= (fly-cost loc3 depot) 89)
	(= (fly-cost loc3 loc1) 83)
	(= (fly-cost loc3 loc2) 176)
	(= (fly-cost loc3 loc4) 79)
	(= (fly-cost loc3 loc5) 92)
	(= (fly-cost loc3 loc6) 159)
	(= (fly-cost loc3 loc7) 84)
	(= (fly-cost loc3 loc8) 101)
	(= (fly-cost loc4 depot) 82)
	(= (fly-cost loc4 loc1) 60)
	(= (fly-cost loc4 loc2) 121)
	(= (fly-cost loc4 loc3) 79)
	(= (fly-cost loc4 loc5) 89)
	(= (fly-cost loc4 loc6) 93)
	(= (fly-cost loc4 loc7) 66)
	(= (fly-cost loc4 loc8) 146)
	(= (fly-cost loc5 depot) 157)
	(= (fly-cost loc5 loc1) 139)
	(= (fly-cost loc5 loc2) 104)
	(= (fly-cost loc5 loc3) 92)
	(= (fly-cost loc5 loc4) 89)
	(= (fly-cost loc5 loc6) 106)
	(= (fly-cost loc5 loc7) 144)
	(= (fly-cost loc5 loc8) 75)
	(= (fly-cost loc6 depot) 171)
	(= (fly-cost loc6 loc1) 148)
	(= (fly-cost loc6 loc2) 39)
	(= (fly-cost loc6 loc3) 159)
	(= (fly-cost loc6 loc4) 93)
	(= (fly-cost loc6 loc5) 106)
	(= (fly-cost loc6 loc7) 154)
	(= (fly-cost loc6 loc8) 180)
	(= (fly-cost loc7 depot) 17)
	(= (fly-cost loc7 loc1) 7)
	(= (fly-cost loc7 loc2) 186)
	(= (fly-cost loc7 loc3) 84)
	(= (fly-cost loc7 loc4) 66)
	(= (fly-cost loc7 loc5) 144)
	(= (fly-cost loc7 loc6) 154)
	(= (fly-cost loc7 loc8) 180)
	(= (fly-cost loc8 depot) 189)
	(= (fly-cost loc8 loc1) 178)
	(= (fly-cost loc8 loc2) 175)
	(= (fly-cost loc8 loc3) 101)
	(= (fly-cost loc8 loc4) 146)
	(= (fly-cost loc8 loc5) 75)
	(= (fly-cost loc8 loc6) 180)
	(= (fly-cost loc8 loc7) 180)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(at-drone drone6 depot)
	(at-drone drone7 depot)
	(at-drone drone8 depot)
	(at-drone drone9 depot)
	(at-drone drone10 depot)
	(has-content person1 food)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person4 medicine)
	(has-content person5 food)
	(has-content person5 medicine)
	(has-content person6 food)
	(has-content person6 medicine)
	))
(:metric minimize (total-time))
)
