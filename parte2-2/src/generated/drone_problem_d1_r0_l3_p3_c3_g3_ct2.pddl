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
	(box-content crate1 food)
	(box-content crate2 medicine)
	(box-content crate3 medicine)
	(at-person person1 loc1)
	(at-person person2 loc3)
	(at-person person3 loc1)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 148)
	(= (fly-cost depot loc2) 194)
	(= (fly-cost depot loc3) 207)
	(= (fly-cost loc1 depot) 148)
	(= (fly-cost loc1 loc2) 150)
	(= (fly-cost loc1 loc3) 69)
	(= (fly-cost loc2 depot) 194)
	(= (fly-cost loc2 loc1) 150)
	(= (fly-cost loc2 loc3) 133)
	(= (fly-cost loc3 depot) 207)
	(= (fly-cost loc3 loc1) 69)
	(= (fly-cost loc3 loc2) 133)
)
(:goal (and
	(at-drone drone1 depot)
	(has-content person1 food)
	(has-content person1 medicine)
	(has-content person3 medicine)
	))
(:metric minimize (total-cost))
)
