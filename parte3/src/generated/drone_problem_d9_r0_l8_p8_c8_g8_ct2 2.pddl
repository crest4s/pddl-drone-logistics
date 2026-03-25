(define (problem drone_problem_d9_r0_l8_p8_c8_g8_ct2)
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
	(at-person person1 loc7)
	(free-person person1)
	(at-person person2 loc4)
	(free-person person2)
	(at-person person3 loc3)
	(free-person person3)
	(at-person person4 loc7)
	(free-person person4)
	(at-person person5 loc4)
	(free-person person5)
	(at-person person6 loc3)
	(free-person person6)
	(at-person person7 loc1)
	(free-person person7)
	(at-person person8 loc1)
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
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 223)
	(= (fly-cost depot loc2) 241)
	(= (fly-cost depot loc3) 62)
	(= (fly-cost depot loc4) 185)
	(= (fly-cost depot loc5) 158)
	(= (fly-cost depot loc6) 173)
	(= (fly-cost depot loc7) 175)
	(= (fly-cost depot loc8) 71)
	(= (fly-cost loc1 depot) 223)
	(= (fly-cost loc1 loc2) 28)
	(= (fly-cost loc1 loc3) 169)
	(= (fly-cost loc1 loc4) 96)
	(= (fly-cost loc1 loc5) 86)
	(= (fly-cost loc1 loc6) 72)
	(= (fly-cost loc1 loc7) 112)
	(= (fly-cost loc1 loc8) 165)
	(= (fly-cost loc2 depot) 241)
	(= (fly-cost loc2 loc1) 28)
	(= (fly-cost loc2 loc3) 184)
	(= (fly-cost loc2 loc4) 123)
	(= (fly-cost loc2 loc5) 112)
	(= (fly-cost loc2 loc6) 77)
	(= (fly-cost loc2 loc7) 109)
	(= (fly-cost loc2 loc8) 186)
	(= (fly-cost loc3 depot) 62)
	(= (fly-cost loc3 loc1) 169)
	(= (fly-cost loc3 loc2) 184)
	(= (fly-cost loc3 loc4) 151)
	(= (fly-cost loc3 loc5) 119)
	(= (fly-cost loc3 loc6) 113)
	(= (fly-cost loc3 loc7) 114)
	(= (fly-cost loc3 loc8) 58)
	(= (fly-cost loc4 depot) 185)
	(= (fly-cost loc4 loc1) 96)
	(= (fly-cost loc4 loc2) 123)
	(= (fly-cost loc4 loc3) 151)
	(= (fly-cost loc4 loc5) 35)
	(= (fly-cost loc4 loc6) 123)
	(= (fly-cost loc4 loc7) 164)
	(= (fly-cost loc4 loc8) 115)
	(= (fly-cost loc5 depot) 158)
	(= (fly-cost loc5 loc1) 86)
	(= (fly-cost loc5 loc2) 112)
	(= (fly-cost loc5 loc3) 119)
	(= (fly-cost loc5 loc4) 35)
	(= (fly-cost loc5 loc6) 93)
	(= (fly-cost loc5 loc7) 132)
	(= (fly-cost loc5 loc8) 91)
	(= (fly-cost loc6 depot) 173)
	(= (fly-cost loc6 loc1) 72)
	(= (fly-cost loc6 loc2) 77)
	(= (fly-cost loc6 loc3) 113)
	(= (fly-cost loc6 loc4) 123)
	(= (fly-cost loc6 loc5) 93)
	(= (fly-cost loc6 loc7) 44)
	(= (fly-cost loc6 loc8) 131)
	(= (fly-cost loc7 depot) 175)
	(= (fly-cost loc7 loc1) 112)
	(= (fly-cost loc7 loc2) 109)
	(= (fly-cost loc7 loc3) 114)
	(= (fly-cost loc7 loc4) 164)
	(= (fly-cost loc7 loc5) 132)
	(= (fly-cost loc7 loc6) 44)
	(= (fly-cost loc7 loc8) 149)
	(= (fly-cost loc8 depot) 71)
	(= (fly-cost loc8 loc1) 165)
	(= (fly-cost loc8 loc2) 186)
	(= (fly-cost loc8 loc3) 58)
	(= (fly-cost loc8 loc4) 115)
	(= (fly-cost loc8 loc5) 91)
	(= (fly-cost loc8 loc6) 131)
	(= (fly-cost loc8 loc7) 149)
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
	(has-content person1 food)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person3 food)
	(has-content person4 medicine)
	(has-content person5 food)
	(has-content person7 food)
	(has-content person8 food)
	))
(:metric minimize (total-time))
)
