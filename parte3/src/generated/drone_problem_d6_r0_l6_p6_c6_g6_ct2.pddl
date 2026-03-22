(define (problem drone_problem_d6_r0_l6_p6_c6_g6_ct2)
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
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(at-person person1 loc5)
	(free-person person1)
	(at-person person2 loc5)
	(free-person person2)
	(at-person person3 loc1)
	(free-person person3)
	(at-person person4 loc2)
	(free-person person4)
	(at-person person5 loc6)
	(free-person person5)
	(at-person person6 loc2)
	(free-person person6)
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
	(= (fly-cost depot loc1) 138)
	(= (fly-cost depot loc2) 209)
	(= (fly-cost depot loc3) 60)
	(= (fly-cost depot loc4) 105)
	(= (fly-cost depot loc5) 106)
	(= (fly-cost depot loc6) 94)
	(= (fly-cost loc1 depot) 138)
	(= (fly-cost loc1 loc2) 177)
	(= (fly-cost loc1 loc3) 99)
	(= (fly-cost loc1 loc4) 124)
	(= (fly-cost loc1 loc5) 112)
	(= (fly-cost loc1 loc6) 44)
	(= (fly-cost loc2 depot) 209)
	(= (fly-cost loc2 loc1) 177)
	(= (fly-cost loc2 loc3) 153)
	(= (fly-cost loc2 loc4) 104)
	(= (fly-cost loc2 loc5) 104)
	(= (fly-cost loc2 loc6) 175)
	(= (fly-cost loc3 depot) 60)
	(= (fly-cost loc3 loc1) 99)
	(= (fly-cost loc3 loc2) 153)
	(= (fly-cost loc3 loc4) 54)
	(= (fly-cost loc3 loc5) 50)
	(= (fly-cost loc3 loc6) 60)
	(= (fly-cost loc4 depot) 105)
	(= (fly-cost loc4 loc1) 124)
	(= (fly-cost loc4 loc2) 104)
	(= (fly-cost loc4 loc3) 54)
	(= (fly-cost loc4 loc5) 13)
	(= (fly-cost loc4 loc6) 98)
	(= (fly-cost loc5 depot) 106)
	(= (fly-cost loc5 loc1) 112)
	(= (fly-cost loc5 loc2) 104)
	(= (fly-cost loc5 loc3) 50)
	(= (fly-cost loc5 loc4) 13)
	(= (fly-cost loc5 loc6) 88)
	(= (fly-cost loc6 depot) 94)
	(= (fly-cost loc6 loc1) 44)
	(= (fly-cost loc6 loc2) 175)
	(= (fly-cost loc6 loc3) 60)
	(= (fly-cost loc6 loc4) 98)
	(= (fly-cost loc6 loc5) 88)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(at-drone drone6 depot)
	(has-content person1 food)
	(has-content person1 medicine)
	(has-content person2 medicine)
	(has-content person3 medicine)
	(has-content person5 food)
	(has-content person5 medicine)
	))
(:metric minimize (total-time))
)
