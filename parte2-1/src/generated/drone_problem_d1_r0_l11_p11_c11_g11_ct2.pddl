(define (problem drone_problem_d1_r0_l11_p11_c11_g11_ct2)
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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 food)
	(box-content crate6 food)
	(box-content crate7 food)
	(box-content crate8 food)
	(box-content crate9 medicine)
	(box-content crate10 medicine)
	(box-content crate11 medicine)
	(at-person person1 loc8)
	(at-person person2 loc3)
	(at-person person3 loc1)
	(at-person person4 loc5)
	(at-person person5 loc3)
	(at-person person6 loc6)
	(at-person person7 loc1)
	(at-person person8 loc6)
	(at-person person9 loc5)
	(at-person person10 loc11)
	(at-person person11 loc11)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person1 medicine)
	(has-content person4 food)
	(has-content person5 medicine)
	(has-content person6 food)
	(has-content person7 food)
	(has-content person8 food)
	(has-content person8 medicine)
	(has-content person9 food)
	(has-content person10 food)
	(has-content person11 food)
	))
)
