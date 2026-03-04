(define (problem drone_problem_d1_r0_l7_p7_c7_g7_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
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
	(at-box crate5 depot)
	(available crate5)
	(at-box crate6 depot)
	(available crate6)
	(at-box crate7 depot)
	(available crate7)
	(box-content crate1 food)
	(box-content crate2 medicine)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(at-person person1 loc1)
	(at-person person2 loc7)
	(at-person person3 loc1)
	(at-person person4 loc1)
	(at-person person5 loc7)
	(at-person person6 loc7)
	(at-person person7 loc7)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person3 medicine)
	(has-content person4 medicine)
	(has-content person5 medicine)
	(has-content person6 medicine)
	(has-content person7 medicine)
	))
)
