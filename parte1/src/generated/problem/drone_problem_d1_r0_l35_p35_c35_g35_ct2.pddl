(define (problem drone_problem_d1_r0_l35_p35_c35_g35_ct2)
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
	loc21 - location
	loc22 - location
	loc23 - location
	loc24 - location
	loc25 - location
	loc26 - location
	loc27 - location
	loc28 - location
	loc29 - location
	loc30 - location
	loc31 - location
	loc32 - location
	loc33 - location
	loc34 - location
	loc35 - location
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
	crate21 - box
	crate22 - box
	crate23 - box
	crate24 - box
	crate25 - box
	crate26 - box
	crate27 - box
	crate28 - box
	crate29 - box
	crate30 - box
	crate31 - box
	crate32 - box
	crate33 - box
	crate34 - box
	crate35 - box
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
	person21 - person
	person22 - person
	person23 - person
	person24 - person
	person25 - person
	person26 - person
	person27 - person
	person28 - person
	person29 - person
	person30 - person
	person31 - person
	person32 - person
	person33 - person
	person34 - person
	person35 - person
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
	(at-box crate21 depot)
	(available crate21)
	(at-box crate22 depot)
	(available crate22)
	(at-box crate23 depot)
	(available crate23)
	(at-box crate24 depot)
	(available crate24)
	(at-box crate25 depot)
	(available crate25)
	(at-box crate26 depot)
	(available crate26)
	(at-box crate27 depot)
	(available crate27)
	(at-box crate28 depot)
	(available crate28)
	(at-box crate29 depot)
	(available crate29)
	(at-box crate30 depot)
	(available crate30)
	(at-box crate31 depot)
	(available crate31)
	(at-box crate32 depot)
	(available crate32)
	(at-box crate33 depot)
	(available crate33)
	(at-box crate34 depot)
	(available crate34)
	(at-box crate35 depot)
	(available crate35)
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
	(box-content crate18 food)
	(box-content crate19 food)
	(box-content crate20 food)
	(box-content crate21 food)
	(box-content crate22 food)
	(box-content crate23 food)
	(box-content crate24 food)
	(box-content crate25 food)
	(box-content crate26 food)
	(box-content crate27 medicine)
	(box-content crate28 medicine)
	(box-content crate29 medicine)
	(box-content crate30 medicine)
	(box-content crate31 medicine)
	(box-content crate32 medicine)
	(box-content crate33 medicine)
	(box-content crate34 medicine)
	(box-content crate35 medicine)
	(at-person person1 loc23)
	(at-person person2 loc1)
	(at-person person3 loc21)
	(at-person person4 loc7)
	(at-person person5 loc10)
	(at-person person6 loc13)
	(at-person person7 loc16)
	(at-person person8 loc13)
	(at-person person9 loc27)
	(at-person person10 loc34)
	(at-person person11 loc26)
	(at-person person12 loc33)
	(at-person person13 loc32)
	(at-person person14 loc31)
	(at-person person15 loc4)
	(at-person person16 loc32)
	(at-person person17 loc23)
	(at-person person18 loc21)
	(at-person person19 loc29)
	(at-person person20 loc29)
	(at-person person21 loc27)
	(at-person person22 loc15)
	(at-person person23 loc22)
	(at-person person24 loc19)
	(at-person person25 loc11)
	(at-person person26 loc19)
	(at-person person27 loc14)
	(at-person person28 loc32)
	(at-person person29 loc33)
	(at-person person30 loc5)
	(at-person person31 loc1)
	(at-person person32 loc23)
	(at-person person33 loc31)
	(at-person person34 loc32)
	(at-person person35 loc11)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person3 food)
	(has-content person3 medicine)
	(has-content person4 food)
	(has-content person5 food)
	(has-content person6 food)
	(has-content person7 food)
	(has-content person8 medicine)
	(has-content person10 food)
	(has-content person10 medicine)
	(has-content person11 food)
	(has-content person13 food)
	(has-content person13 medicine)
	(has-content person14 food)
	(has-content person15 food)
	(has-content person16 food)
	(has-content person17 food)
	(has-content person18 food)
	(has-content person19 food)
	(has-content person22 food)
	(has-content person23 food)
	(has-content person24 food)
	(has-content person24 medicine)
	(has-content person25 food)
	(has-content person26 medicine)
	(has-content person27 food)
	(has-content person28 food)
	(has-content person29 food)
	(has-content person30 food)
	(has-content person30 medicine)
	(has-content person31 food)
	(has-content person32 food)
	(has-content person33 food)
	(has-content person35 medicine)
	))
)
