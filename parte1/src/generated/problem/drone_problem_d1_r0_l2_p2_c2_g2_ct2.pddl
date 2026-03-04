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
	left-arm1 - arm
	right-arm1 - arm
)
(:init
	(at-drone drone1 depot)
	(empty left-arm1 drone1)
	(empty right-arm1 drone1)
	(at-box crate1 depot)
	(available crate1)
	(at-box crate2 depot)
	(available crate2)
	(box-content crate1 food)
	(box-content crate2 medicine)
	(at-person person1 loc2)
	(at-person person2 loc1)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	))
)
