(define (problem drone_problem_d1_r0_l14_p14_c14_g14_ct2)
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
	loc10 - location
	loc11 - location
	loc12 - location
	loc13 - location
	loc14 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	crate7 - box
	crate8 - box
	crate9 - box
	crate10 - box
	crate11 - box
	crate12 - box
	crate13 - box
	crate14 - box
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
	person10 - person
	person11 - person
	person12 - person
	person13 - person
	person14 - person
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
	(at-box crate10 depot)
	(available crate10)
	(at-box crate11 depot)
	(available crate11)
	(at-box crate12 depot)
	(available crate12)
	(at-box crate13 depot)
	(available crate13)
	(at-box crate14 depot)
	(available crate14)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(box-content crate8 medicine)
	(box-content crate9 medicine)
	(box-content crate10 medicine)
	(box-content crate11 medicine)
	(box-content crate12 medicine)
	(box-content crate13 medicine)
	(box-content crate14 medicine)
	(at-person person1 loc13)
	(at-person person2 loc8)
	(at-person person3 loc13)
	(at-person person4 loc14)
	(at-person person5 loc9)
	(at-person person6 loc12)
	(at-person person7 loc10)
	(at-person person8 loc13)
	(at-person person9 loc5)
	(at-person person10 loc8)
	(at-person person11 loc9)
	(at-person person12 loc4)
	(at-person person13 loc14)
	(at-person person14 loc8)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person3 medicine)
	(has-content person4 food)
	(has-content person4 medicine)
	(has-content person5 medicine)
	(has-content person7 medicine)
	(has-content person8 medicine)
	(has-content person9 food)
	(has-content person10 medicine)
	(has-content person11 medicine)
	(has-content person12 medicine)
	(has-content person13 medicine)
	(has-content person14 medicine)
	))
)
