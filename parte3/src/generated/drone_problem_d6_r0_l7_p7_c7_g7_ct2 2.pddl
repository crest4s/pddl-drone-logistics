(define (problem drone_problem_d6_r0_l7_p7_c7_g7_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
	drone4 - drone
	drone5 - drone
	drone6 - drone
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
	transporter4 - transporter
	transporter5 - transporter
	transporter6 - transporter
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
	(at-person person1 loc5)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-person person3 loc2)
	(free-person person3)
	(at-person person4 loc5)
	(free-person person4)
	(at-person person5 loc1)
	(free-person person5)
	(at-person person6 loc6)
	(free-person person6)
	(at-person person7 loc7)
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
	(at-transporter transporter4 depot)
	(transporter-count transporter4 num0)
	(free-transporter transporter4)
	(at-transporter transporter5 depot)
	(transporter-count transporter5 num0)
	(free-transporter transporter5)
	(at-transporter transporter6 depot)
	(transporter-count transporter6 num0)
	(free-transporter transporter6)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 126)
	(= (fly-cost depot loc2) 249)
	(= (fly-cost depot loc3) 83)
	(= (fly-cost depot loc4) 76)
	(= (fly-cost depot loc5) 108)
	(= (fly-cost depot loc6) 232)
	(= (fly-cost depot loc7) 202)
	(= (fly-cost loc1 depot) 126)
	(= (fly-cost loc1 loc2) 135)
	(= (fly-cost loc1 loc3) 46)
	(= (fly-cost loc1 loc4) 62)
	(= (fly-cost loc1 loc5) 98)
	(= (fly-cost loc1 loc6) 135)
	(= (fly-cost loc1 loc7) 85)
	(= (fly-cost loc2 depot) 249)
	(= (fly-cost loc2 loc1) 135)
	(= (fly-cost loc2 loc3) 178)
	(= (fly-cost loc2 loc4) 174)
	(= (fly-cost loc2 loc5) 166)
	(= (fly-cost loc2 loc6) 48)
	(= (fly-cost loc2 loc7) 50)
	(= (fly-cost loc3 depot) 83)
	(= (fly-cost loc3 loc1) 46)
	(= (fly-cost loc3 loc2) 178)
	(= (fly-cost loc3 loc4) 39)
	(= (fly-cost loc3 loc5) 92)
	(= (fly-cost loc3 loc6) 172)
	(= (fly-cost loc3 loc7) 129)
	(= (fly-cost loc4 depot) 76)
	(= (fly-cost loc4 loc1) 62)
	(= (fly-cost loc4 loc2) 174)
	(= (fly-cost loc4 loc3) 39)
	(= (fly-cost loc4 loc5) 55)
	(= (fly-cost loc4 loc6) 158)
	(= (fly-cost loc4 loc7) 128)
	(= (fly-cost loc5 depot) 108)
	(= (fly-cost loc5 loc1) 98)
	(= (fly-cost loc5 loc2) 166)
	(= (fly-cost loc5 loc3) 92)
	(= (fly-cost loc5 loc4) 55)
	(= (fly-cost loc5 loc6) 136)
	(= (fly-cost loc5 loc7) 129)
	(= (fly-cost loc6 depot) 232)
	(= (fly-cost loc6 loc1) 135)
	(= (fly-cost loc6 loc2) 48)
	(= (fly-cost loc6 loc3) 172)
	(= (fly-cost loc6 loc4) 158)
	(= (fly-cost loc6 loc5) 136)
	(= (fly-cost loc6 loc7) 64)
	(= (fly-cost loc7 depot) 202)
	(= (fly-cost loc7 loc1) 85)
	(= (fly-cost loc7 loc2) 50)
	(= (fly-cost loc7 loc3) 129)
	(= (fly-cost loc7 loc4) 128)
	(= (fly-cost loc7 loc5) 129)
	(= (fly-cost loc7 loc6) 64)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(at-drone drone6 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person5 food)
	(has-content person6 food)
	(has-content person7 food)
	))
(:metric minimize (total-time))
)
