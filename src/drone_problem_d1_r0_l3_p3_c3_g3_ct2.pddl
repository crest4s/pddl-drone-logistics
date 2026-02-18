(define (problem drone_problem_d1_r0_l3_p3_c3_g3_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
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
)
(:init
	(at-drone drone1 depot)
	(empty-left drone1)
	(empty-right drone1)
	(at-box crate1 depot)
	(at-box crate2 depot)
	(at-box crate3 depot)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(at-person person1 loc1)
	(at-person person2 loc2)
	(at-person person3 loc3)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person3 food)
	))
)
