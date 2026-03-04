(define (problem drone_problem_d1_r0_l9_p9_c9_g9_ct2)
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
	loc8 - location
	loc9 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	crate7 - box
	crate8 - box
	crate9 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
	person9 - person
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
	(at-box crate8 depot)
	(available crate8)
	(at-box crate9 depot)
	(available crate9)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 food)
	(box-content crate6 food)
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(box-content crate9 medicine)
	(at-person person1 loc7)
	(at-person person2 loc2)
	(at-person person3 loc7)
	(at-person person4 loc7)
	(at-person person5 loc8)
	(at-person person6 loc5)
	(at-person person7 loc8)
	(at-person person8 loc1)
	(at-person person9 loc7)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person4 food)
	(has-content person4 medicine)
	(has-content person5 food)
	(has-content person6 food)
	(has-content person6 medicine)
	(has-content person7 food)
	(has-content person9 food)
	(has-content person9 medicine)
	))
)
