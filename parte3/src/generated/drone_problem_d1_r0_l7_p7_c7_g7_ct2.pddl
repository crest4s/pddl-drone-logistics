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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 food)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(at-person person1 loc1)
	(free-person person1)
	(at-person person2 loc3)
	(free-person person2)
	(at-person person3 loc5)
	(free-person person3)
	(at-person person4 loc3)
	(free-person person4)
	(at-person person5 loc7)
	(free-person person5)
	(at-person person6 loc2)
	(free-person person6)
	(at-person person7 loc2)
	(free-person person7)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(free-transporter transporter1)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 128)
	(= (fly-cost depot loc2) 89)
	(= (fly-cost depot loc3) 157)
	(= (fly-cost depot loc4) 243)
	(= (fly-cost depot loc5) 173)
	(= (fly-cost depot loc6) 90)
	(= (fly-cost depot loc7) 107)
	(= (fly-cost loc1 depot) 128)
	(= (fly-cost loc1 loc2) 54)
	(= (fly-cost loc1 loc3) 39)
	(= (fly-cost loc1 loc4) 115)
	(= (fly-cost loc1 loc5) 120)
	(= (fly-cost loc1 loc6) 92)
	(= (fly-cost loc1 loc7) 26)
	(= (fly-cost loc2 depot) 89)
	(= (fly-cost loc2 loc1) 54)
	(= (fly-cost loc2 loc3) 71)
	(= (fly-cost loc2 loc4) 159)
	(= (fly-cost loc2 loc5) 100)
	(= (fly-cost loc2 loc6) 41)
	(= (fly-cost loc2 loc7) 29)
	(= (fly-cost loc3 depot) 157)
	(= (fly-cost loc3 loc1) 39)
	(= (fly-cost loc3 loc2) 71)
	(= (fly-cost loc3 loc4) 89)
	(= (fly-cost loc3 loc5) 96)
	(= (fly-cost loc3 loc6) 98)
	(= (fly-cost loc3 loc7) 51)
	(= (fly-cost loc4 depot) 243)
	(= (fly-cost loc4 loc1) 115)
	(= (fly-cost loc4 loc2) 159)
	(= (fly-cost loc4 loc3) 89)
	(= (fly-cost loc4 loc5) 155)
	(= (fly-cost loc4 loc6) 185)
	(= (fly-cost loc4 loc7) 136)
	(= (fly-cost loc5 depot) 173)
	(= (fly-cost loc5 loc1) 120)
	(= (fly-cost loc5 loc2) 100)
	(= (fly-cost loc5 loc3) 96)
	(= (fly-cost loc5 loc4) 155)
	(= (fly-cost loc5 loc6) 84)
	(= (fly-cost loc5 loc7) 109)
	(= (fly-cost loc6 depot) 90)
	(= (fly-cost loc6 loc1) 92)
	(= (fly-cost loc6 loc2) 41)
	(= (fly-cost loc6 loc3) 98)
	(= (fly-cost loc6 loc4) 185)
	(= (fly-cost loc6 loc5) 84)
	(= (fly-cost loc6 loc7) 68)
	(= (fly-cost loc7 depot) 107)
	(= (fly-cost loc7 loc1) 26)
	(= (fly-cost loc7 loc2) 29)
	(= (fly-cost loc7 loc3) 51)
	(= (fly-cost loc7 loc4) 136)
	(= (fly-cost loc7 loc5) 109)
	(= (fly-cost loc7 loc6) 68)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person4 food)
	(has-content person5 food)
	(has-content person5 medicine)
	(has-content person6 food)
	(has-content person6 medicine)
	(has-content person7 food)
	))
(:metric minimize (total-time))
)
