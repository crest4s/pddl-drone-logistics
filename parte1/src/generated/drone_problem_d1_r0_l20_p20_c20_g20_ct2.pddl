(define (problem drone_problem_d1_r0_l20_p20_c20_g20_ct2)
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
	loc15 - location
	loc16 - location
	loc17 - location
	loc18 - location
	loc19 - location
	loc20 - location
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
	crate15 - box
	crate16 - box
	crate17 - box
	crate18 - box
	crate19 - box
	crate20 - box
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
	person15 - person
	person16 - person
	person17 - person
	person18 - person
	person19 - person
	person20 - person
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
	(at-box crate15 depot)
	(available crate15)
	(at-box crate16 depot)
	(available crate16)
	(at-box crate17 depot)
	(available crate17)
	(at-box crate18 depot)
	(available crate18)
	(at-box crate19 depot)
	(available crate19)
	(at-box crate20 depot)
	(available crate20)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 food)
	(box-content crate6 food)
	(box-content crate7 food)
	(box-content crate8 food)
	(box-content crate9 food)
	(box-content crate10 food)
	(box-content crate11 food)
	(box-content crate12 food)
	(box-content crate13 food)
	(box-content crate14 food)
	(box-content crate15 food)
	(box-content crate16 food)
	(box-content crate17 food)
	(box-content crate18 medicine)
	(box-content crate19 medicine)
	(box-content crate20 medicine)
	(at-person person1 loc16)
	(at-person person2 loc19)
	(at-person person3 loc13)
	(at-person person4 loc4)
	(at-person person5 loc9)
	(at-person person6 loc15)
	(at-person person7 loc13)
	(at-person person8 loc4)
	(at-person person9 loc9)
	(at-person person10 loc8)
	(at-person person11 loc6)
	(at-person person12 loc1)
	(at-person person13 loc19)
	(at-person person14 loc18)
	(at-person person15 loc6)
	(at-person person16 loc5)
	(at-person person17 loc19)
	(at-person person18 loc4)
	(at-person person19 loc3)
	(at-person person20 loc15)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person2 food)
	(has-content person3 food)
	(has-content person5 medicine)
	(has-content person6 food)
	(has-content person8 food)
	(has-content person9 food)
	(has-content person10 food)
	(has-content person11 food)
	(has-content person12 food)
	(has-content person13 food)
	(has-content person14 food)
	(has-content person14 medicine)
	(has-content person15 food)
	(has-content person16 food)
	(has-content person17 food)
	(has-content person18 food)
	(has-content person19 food)
	(has-content person19 medicine)
	(has-content person20 food)
	))
)
