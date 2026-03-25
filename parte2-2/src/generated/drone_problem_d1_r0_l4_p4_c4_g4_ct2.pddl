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
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(at-person person1 loc1)
	(at-person person2 loc4)
	(at-person person3 loc2)
	(at-person person4 loc2)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 102)
	(= (fly-cost depot loc2) 232)
	(= (fly-cost depot loc3) 127)
	(= (fly-cost depot loc4) 60)
	(= (fly-cost loc1 depot) 102)
	(= (fly-cost loc1 loc2) 132)
	(= (fly-cost loc1 loc3) 56)
	(= (fly-cost loc1 loc4) 44)
	(= (fly-cost loc2 depot) 232)
	(= (fly-cost loc2 loc1) 132)
	(= (fly-cost loc2 loc3) 117)
	(= (fly-cost loc2 loc4) 175)
	(= (fly-cost loc3 depot) 127)
	(= (fly-cost loc3 loc1) 56)
	(= (fly-cost loc3 loc2) 117)
	(= (fly-cost loc3 loc4) 84)
	(= (fly-cost loc4 depot) 60)
	(= (fly-cost loc4 loc1) 44)
	(= (fly-cost loc4 loc2) 175)
	(= (fly-cost loc4 loc3) 84)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person3 medicine)
	(has-content person4 food)
	))
(:metric minimize (total-cost))
)
