(define (problem drone_problem_d3_r0_l5_p5_c5_g5_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
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
	transporter2 - transporter
	transporter3 - transporter
	num0 - num
	num1 - num
	num2 - num
	num3 - num
	num4 - num
)
(:init
	(at-drone drone1 depot)
	(free-drone drone1)
	(at-drone drone2 depot)
	(free-drone drone2)
	(at-drone drone3 depot)
	(free-drone drone3)
	(at-box crate1 depot)
	(available crate1)
	(free-box crate1)
	(at-box crate2 depot)
	(available crate2)
	(free-box crate2)
	(at-box crate3 depot)
	(available crate3)
	(free-box crate3)
	(at-box crate4 depot)
	(available crate4)
	(free-box crate4)
	(at-box crate5 depot)
	(available crate5)
	(free-box crate5)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 medicine)
	(at-person person1 loc3)
	(free-person person1)
	(at-person person2 loc2)
	(free-person person2)
	(at-person person3 loc3)
	(free-person person3)
	(at-person person4 loc4)
	(free-person person4)
	(at-person person5 loc4)
	(free-person person5)
	(at-transporter transporter1 depot)
	(transporter-count transporter1 num0)
	(free-transporter transporter1)
	(at-transporter transporter2 depot)
	(transporter-count transporter2 num0)
	(free-transporter transporter2)
	(at-transporter transporter3 depot)
	(transporter-count transporter3 num0)
	(free-transporter transporter3)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 210)
	(= (fly-cost depot loc2) 28)
	(= (fly-cost depot loc3) 135)
	(= (fly-cost depot loc4) 244)
	(= (fly-cost depot loc5) 157)
	(= (fly-cost loc1 depot) 210)
	(= (fly-cost loc1 loc2) 186)
	(= (fly-cost loc1 loc3) 164)
	(= (fly-cost loc1 loc4) 43)
	(= (fly-cost loc1 loc5) 168)
	(= (fly-cost loc2 depot) 28)
	(= (fly-cost loc2 loc1) 186)
	(= (fly-cost loc2 loc3) 112)
	(= (fly-cost loc2 loc4) 218)
	(= (fly-cost loc2 loc5) 134)
	(= (fly-cost loc3 depot) 135)
	(= (fly-cost loc3 loc1) 164)
	(= (fly-cost loc3 loc2) 112)
	(= (fly-cost loc3 loc4) 176)
	(= (fly-cost loc3 loc5) 23)
	(= (fly-cost loc4 depot) 244)
	(= (fly-cost loc4 loc1) 43)
	(= (fly-cost loc4 loc2) 218)
	(= (fly-cost loc4 loc3) 176)
	(= (fly-cost loc4 loc5) 175)
	(= (fly-cost loc5 depot) 157)
	(= (fly-cost loc5 loc1) 168)
	(= (fly-cost loc5 loc2) 134)
	(= (fly-cost loc5 loc3) 23)
	(= (fly-cost loc5 loc4) 175)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person3 food)
	(has-content person4 food)
	(has-content person5 food)
	))
(:metric minimize (total-time))
)
