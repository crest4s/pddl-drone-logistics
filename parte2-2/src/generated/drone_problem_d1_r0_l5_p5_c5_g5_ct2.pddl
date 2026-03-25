(define (problem drone_problem_d1_r0_l5_p5_c5_g5_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
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
	(box-content crate1 food)
	(box-content crate2 medicine)
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(at-person person1 loc5)
	(at-person person2 loc1)
	(at-person person3 loc1)
	(at-person person4 loc4)
	(at-person person5 loc3)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 139)
	(= (fly-cost depot loc2) 136)
	(= (fly-cost depot loc3) 197)
	(= (fly-cost depot loc4) 144)
	(= (fly-cost depot loc5) 102)
	(= (fly-cost loc1 depot) 139)
	(= (fly-cost loc1 loc2) 17)
	(= (fly-cost loc1 loc3) 79)
	(= (fly-cost loc1 loc4) 19)
	(= (fly-cost loc1 loc5) 115)
	(= (fly-cost loc2 depot) 136)
	(= (fly-cost loc2 loc1) 17)
	(= (fly-cost loc2 loc3) 70)
	(= (fly-cost loc2 loc4) 9)
	(= (fly-cost loc2 loc5) 124)
	(= (fly-cost loc3 depot) 197)
	(= (fly-cost loc3 loc1) 79)
	(= (fly-cost loc3 loc2) 70)
	(= (fly-cost loc3 loc4) 63)
	(= (fly-cost loc3 loc5) 193)
	(= (fly-cost loc4 depot) 144)
	(= (fly-cost loc4 loc1) 19)
	(= (fly-cost loc4 loc2) 9)
	(= (fly-cost loc4 loc3) 63)
	(= (fly-cost loc4 loc5) 131)
	(= (fly-cost loc5 depot) 102)
	(= (fly-cost loc5 loc1) 115)
	(= (fly-cost loc5 loc2) 124)
	(= (fly-cost loc5 loc3) 193)
	(= (fly-cost loc5 loc4) 131)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person4 medicine)
	(has-content person5 medicine)
	))
(:metric minimize (total-cost))
)
