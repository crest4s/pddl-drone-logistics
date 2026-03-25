(define (problem drone_problem_d10_r0_l5_p5_c5_g5_ct2)
(:domain drone-domain)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
	drone4 - drone
	drone5 - drone
	drone6 - drone
	drone7 - drone
	drone8 - drone
	drone9 - drone
	drone10 - drone
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
	transporter4 - transporter
	transporter5 - transporter
	transporter6 - transporter
	transporter7 - transporter
	transporter8 - transporter
	transporter9 - transporter
	transporter10 - transporter
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
	(at-drone drone4 depot)
	(free-drone drone4)
	(at-drone drone5 depot)
	(free-drone drone5)
	(at-drone drone6 depot)
	(free-drone drone6)
	(at-drone drone7 depot)
	(free-drone drone7)
	(at-drone drone8 depot)
	(free-drone drone8)
	(at-drone drone9 depot)
	(free-drone drone9)
	(at-drone drone10 depot)
	(free-drone drone10)
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
	(box-content crate3 medicine)
	(box-content crate4 medicine)
	(box-content crate5 medicine)
	(at-person person1 loc2)
	(free-person person1)
	(at-person person2 loc5)
	(free-person person2)
	(at-person person3 loc5)
	(free-person person3)
	(at-person person4 loc3)
	(free-person person4)
	(at-person person5 loc1)
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
	(at-transporter transporter4 depot)
	(transporter-count transporter4 num0)
	(free-transporter transporter4)
	(at-transporter transporter5 depot)
	(transporter-count transporter5 num0)
	(free-transporter transporter5)
	(at-transporter transporter6 depot)
	(transporter-count transporter6 num0)
	(free-transporter transporter6)
	(at-transporter transporter7 depot)
	(transporter-count transporter7 num0)
	(free-transporter transporter7)
	(at-transporter transporter8 depot)
	(transporter-count transporter8 num0)
	(free-transporter transporter8)
	(at-transporter transporter9 depot)
	(transporter-count transporter9 num0)
	(free-transporter transporter9)
	(at-transporter transporter10 depot)
	(transporter-count transporter10 num0)
	(free-transporter transporter10)
	(siguiente num0 num1)
	(siguiente num1 num2)
	(siguiente num2 num3)
	(siguiente num3 num4)
	(= (fly-cost depot loc1) 173)
	(= (fly-cost depot loc2) 166)
	(= (fly-cost depot loc3) 70)
	(= (fly-cost depot loc4) 210)
	(= (fly-cost depot loc5) 214)
	(= (fly-cost loc1 depot) 173)
	(= (fly-cost loc1 loc2) 25)
	(= (fly-cost loc1 loc3) 162)
	(= (fly-cost loc1 loc4) 151)
	(= (fly-cost loc1 loc5) 79)
	(= (fly-cost loc2 depot) 166)
	(= (fly-cost loc2 loc1) 25)
	(= (fly-cost loc2 loc3) 165)
	(= (fly-cost loc2 loc4) 172)
	(= (fly-cost loc2 loc5) 103)
	(= (fly-cost loc3 depot) 70)
	(= (fly-cost loc3 loc1) 162)
	(= (fly-cost loc3 loc2) 165)
	(= (fly-cost loc3 loc4) 149)
	(= (fly-cost loc3 loc5) 176)
	(= (fly-cost loc4 depot) 210)
	(= (fly-cost loc4 loc1) 151)
	(= (fly-cost loc4 loc2) 172)
	(= (fly-cost loc4 loc3) 149)
	(= (fly-cost loc4 loc5) 92)
	(= (fly-cost loc5 depot) 214)
	(= (fly-cost loc5 loc1) 79)
	(= (fly-cost loc5 loc2) 103)
	(= (fly-cost loc5 loc3) 176)
	(= (fly-cost loc5 loc4) 92)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(at-drone drone6 depot)
	(at-drone drone7 depot)
	(at-drone drone8 depot)
	(at-drone drone9 depot)
	(at-drone drone10 depot)
	(has-content person1 food)
	(has-content person1 medicine)
	(has-content person2 food)
	(has-content person2 medicine)
	(has-content person4 medicine)
	))
(:metric minimize (total-time))
)
