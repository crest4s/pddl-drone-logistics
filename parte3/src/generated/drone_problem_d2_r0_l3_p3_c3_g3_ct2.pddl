(define (problem drone_problem_d2_r0_l3_p3_c3_g3_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(at-person person1 loc1)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-person person3 loc1)
	(free-person person3)
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
	(= (fly-cost depot loc1) 193)
	(= (fly-cost depot loc2) 93)
	(= (fly-cost depot loc3) 118)
	(= (fly-cost loc1 depot) 193)
	(= (fly-cost loc1 loc2) 106)
	(= (fly-cost loc1 loc3) 78)
	(= (fly-cost loc2 depot) 93)
	(= (fly-cost loc2 loc1) 106)
	(= (fly-cost loc2 loc3) 47)
	(= (fly-cost loc3 depot) 118)
	(= (fly-cost loc3 loc1) 78)
	(= (fly-cost loc3 loc2) 47)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(has-content person1 food)
	(has-content person1 medicine)
	(has-content person3 food)
	))
(:metric minimize (total-time))
)
