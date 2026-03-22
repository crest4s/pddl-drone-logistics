(define (problem drone_problem_d3_r0_l2_p2_c2_g2_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
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
	(box-content crate1 food)
	(box-content crate2 medicine)
	(at-person person1 loc2)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
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
	(= (fly-cost depot loc1) 190)
	(= (fly-cost depot loc2) 225)
	(= (fly-cost loc1 depot) 190)
	(= (fly-cost loc1 loc2) 129)
	(= (fly-cost loc2 depot) 225)
	(= (fly-cost loc2 loc1) 129)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(has-content person2 food)
	(has-content person2 medicine)
	))
(:metric minimize (total-time))
)
