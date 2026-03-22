(define (problem drone_problem_d2_r0_l7_p7_c7_g7_ct2)
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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 food)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(at-person person1 loc5)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-person person3 loc4)
	(free-person person3)
	(at-person person4 loc1)
	(free-person person4)
	(at-person person5 loc7)
	(free-person person5)
	(at-person person6 loc1)
	(free-person person6)
	(at-person person7 loc5)
	(free-person person7)
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
	(= (fly-cost depot loc1) 148)
	(= (fly-cost depot loc2) 226)
	(= (fly-cost depot loc3) 205)
	(= (fly-cost depot loc4) 110)
	(= (fly-cost depot loc5) 82)
	(= (fly-cost depot loc6) 68)
	(= (fly-cost depot loc7) 90)
	(= (fly-cost loc1 depot) 148)
	(= (fly-cost loc1 loc2) 94)
	(= (fly-cost loc1 loc3) 57)
	(= (fly-cost loc1 loc4) 138)
	(= (fly-cost loc1 loc5) 76)
	(= (fly-cost loc1 loc6) 102)
	(= (fly-cost loc1 loc7) 58)
	(= (fly-cost loc2 depot) 226)
	(= (fly-cost loc2 loc1) 94)
	(= (fly-cost loc2 loc3) 61)
	(= (fly-cost loc2 loc4) 170)
	(= (fly-cost loc2 loc5) 166)
	(= (fly-cost loc2 loc6) 163)
	(= (fly-cost loc2 loc7) 142)
	(= (fly-cost loc3 depot) 205)
	(= (fly-cost loc3 loc1) 57)
	(= (fly-cost loc3 loc2) 61)
	(= (fly-cost loc3 loc4) 181)
	(= (fly-cost loc3 loc5) 132)
	(= (fly-cost loc3 loc6) 155)
	(= (fly-cost loc3 loc7) 115)
	(= (fly-cost loc4 depot) 110)
	(= (fly-cost loc4 loc1) 138)
	(= (fly-cost loc4 loc2) 170)
	(= (fly-cost loc4 loc3) 181)
	(= (fly-cost loc4 loc5) 127)
	(= (fly-cost loc4 loc6) 58)
	(= (fly-cost loc4 loc7) 106)
	(= (fly-cost loc5 depot) 82)
	(= (fly-cost loc5 loc1) 76)
	(= (fly-cost loc5 loc2) 166)
	(= (fly-cost loc5 loc3) 132)
	(= (fly-cost loc5 loc4) 127)
	(= (fly-cost loc5 loc6) 71)
	(= (fly-cost loc5 loc7) 30)
	(= (fly-cost loc6 depot) 68)
	(= (fly-cost loc6 loc1) 102)
	(= (fly-cost loc6 loc2) 163)
	(= (fly-cost loc6 loc3) 155)
	(= (fly-cost loc6 loc4) 58)
	(= (fly-cost loc6 loc5) 71)
	(= (fly-cost loc6 loc7) 54)
	(= (fly-cost loc7 depot) 90)
	(= (fly-cost loc7 loc1) 58)
	(= (fly-cost loc7 loc2) 142)
	(= (fly-cost loc7 loc3) 115)
	(= (fly-cost loc7 loc4) 106)
	(= (fly-cost loc7 loc5) 30)
	(= (fly-cost loc7 loc6) 54)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person5 food)
	(has-content person6 food)
	))
(:metric minimize (total-time))
)
