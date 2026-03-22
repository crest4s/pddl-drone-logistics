(define (problem drone_problem_d6_r0_l3_p3_c3_g3_ct2)
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
	crate1 - box
	crate2 - box
	crate3 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(at-person person1 loc1)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-person person3 loc3)
	(free-person person3)
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
	(= (fly-cost depot loc1) 245)
	(= (fly-cost depot loc2) 59)
	(= (fly-cost depot loc3) 157)
	(= (fly-cost loc1 depot) 245)
	(= (fly-cost loc1 loc2) 193)
	(= (fly-cost loc1 loc3) 154)
	(= (fly-cost loc2 depot) 59)
	(= (fly-cost loc2 loc1) 193)
	(= (fly-cost loc2 loc3) 100)
	(= (fly-cost loc3 depot) 157)
	(= (fly-cost loc3 loc1) 154)
	(= (fly-cost loc3 loc2) 100)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(at-drone drone6 depot)
	(has-content person1 food)
	(has-content person2 food)
	(has-content person3 medicine)
	))
(:metric minimize (total-time))
)
