(define (problem drone_problem_d1_r0_l4_p4_c4_g4_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
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
	(at-box crate3 depot)
	(available crate3)
	(at-box crate4 depot)
	(available crate4)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(at-person person1 loc3)
	(at-person person2 loc3)
	(at-person person3 loc2)
	(at-person person4 loc3)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person2 medicine)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person4 medicine)
	))
)
