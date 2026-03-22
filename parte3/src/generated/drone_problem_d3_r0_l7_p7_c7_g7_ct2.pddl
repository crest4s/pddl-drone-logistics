(define (problem drone_problem_d3_r0_l7_p7_c7_g7_ct2)
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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 food)
	(box-content crate6 food)
	(box-content crate7 medicine)
	(at-person person1 loc2)
	(free-person person1)
	(at-person person2 loc1)
	(free-person person2)
	(at-person person3 loc7)
	(free-person person3)
	(at-person person4 loc4)
	(free-person person4)
	(at-person person5 loc7)
	(free-person person5)
	(at-person person6 loc4)
	(free-person person6)
	(at-person person7 loc6)
	(free-person person7)
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
	(= (fly-cost depot loc1) 170)
	(= (fly-cost depot loc2) 162)
	(= (fly-cost depot loc3) 10)
	(= (fly-cost depot loc4) 197)
	(= (fly-cost depot loc5) 90)
	(= (fly-cost depot loc6) 194)
	(= (fly-cost depot loc7) 125)
	(= (fly-cost loc1 depot) 170)
	(= (fly-cost loc1 loc2) 35)
	(= (fly-cost loc1 loc3) 161)
	(= (fly-cost loc1 loc4) 193)
	(= (fly-cost loc1 loc5) 90)
	(= (fly-cost loc1 loc6) 47)
	(= (fly-cost loc1 loc7) 46)
	(= (fly-cost loc2 depot) 162)
	(= (fly-cost loc2 loc1) 35)
	(= (fly-cost loc2 loc3) 153)
	(= (fly-cost loc2 loc4) 159)
	(= (fly-cost loc2 loc5) 74)
	(= (fly-cost loc2 loc6) 81)
	(= (fly-cost loc2 loc7) 42)
	(= (fly-cost loc3 depot) 10)
	(= (fly-cost loc3 loc1) 161)
	(= (fly-cost loc3 loc2) 153)
	(= (fly-cost loc3 loc4) 195)
	(= (fly-cost loc3 loc5) 82)
	(= (fly-cost loc3 loc6) 185)
	(= (fly-cost loc3 loc7) 117)
	(= (fly-cost loc4 depot) 197)
	(= (fly-cost loc4 loc1) 193)
	(= (fly-cost loc4 loc2) 159)
	(= (fly-cost loc4 loc3) 195)
	(= (fly-cost loc4 loc5) 148)
	(= (fly-cost loc4 loc6) 240)
	(= (fly-cost loc4 loc7) 172)
	(= (fly-cost loc5 depot) 90)
	(= (fly-cost loc5 loc1) 90)
	(= (fly-cost loc5 loc2) 74)
	(= (fly-cost loc5 loc3) 82)
	(= (fly-cost loc5 loc4) 148)
	(= (fly-cost loc5 loc6) 126)
	(= (fly-cost loc5 loc7) 46)
	(= (fly-cost loc6 depot) 194)
	(= (fly-cost loc6 loc1) 47)
	(= (fly-cost loc6 loc2) 81)
	(= (fly-cost loc6 loc3) 185)
	(= (fly-cost loc6 loc4) 240)
	(= (fly-cost loc6 loc5) 126)
	(= (fly-cost loc6 loc7) 82)
	(= (fly-cost loc7 depot) 125)
	(= (fly-cost loc7 loc1) 46)
	(= (fly-cost loc7 loc2) 42)
	(= (fly-cost loc7 loc3) 117)
	(= (fly-cost loc7 loc4) 172)
	(= (fly-cost loc7 loc5) 46)
	(= (fly-cost loc7 loc6) 82)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(has-content person1 food)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person5 food)
	(has-content person6 food)
	))
(:metric minimize (total-time))
)
