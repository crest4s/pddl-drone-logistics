(define (problem drone_problem_d1_r0_l2_p2_c2_g2_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	crate1 - box
	crate2 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
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
	(box-content crate1 food)
	(box-content crate2 medicine)
	(at-person person1 loc2)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(free-transporter transporter1)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 116)
	(= (fly-cost depot loc2) 23)
	(= (fly-cost loc1 depot) 116)
	(= (fly-cost loc1 loc2) 106)
	(= (fly-cost loc2 depot) 23)
	(= (fly-cost loc2 loc1) 106)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person1 medicine)
	))
(:metric minimize (total-time))
)
