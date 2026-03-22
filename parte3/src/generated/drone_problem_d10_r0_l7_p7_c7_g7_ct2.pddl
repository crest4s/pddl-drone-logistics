(define (problem drone_problem_d10_r0_l7_p7_c7_g7_ct2)
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
	loc6 - location
	loc7 - location
	crate1 - box
	crate2 - box
	crate3 - box
	crate4 - box
	crate5 - box
	crate6 - box
	crate7 - box
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
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
	(at-box crate6 depot)
	(available crate6)
	(free-box crate6)
	(at-box crate7 depot)
	(available crate7)
	(free-box crate7)
	(box-content crate1 food)
	(box-content crate2 food)
	(box-content crate3 food)
	(box-content crate4 food)
	(box-content crate5 medicine)
	(box-content crate6 medicine)
	(box-content crate7 medicine)
	(at-person person1 loc7)
	(free-person person1)
	(at-person person2 loc4)
	(free-person person2)
	(at-person person3 loc1)
	(free-person person3)
	(at-person person4 loc3)
	(free-person person4)
	(at-person person5 loc5)
	(free-person person5)
	(at-person person6 loc5)
	(free-person person6)
	(at-person person7 loc4)
	(free-person person7)
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
	(= (fly-cost depot loc1) 255)
	(= (fly-cost depot loc2) 183)
	(= (fly-cost depot loc3) 185)
	(= (fly-cost depot loc4) 232)
	(= (fly-cost depot loc5) 65)
	(= (fly-cost depot loc6) 235)
	(= (fly-cost depot loc7) 120)
	(= (fly-cost loc1 depot) 255)
	(= (fly-cost loc1 loc2) 91)
	(= (fly-cost loc1 loc3) 150)
	(= (fly-cost loc1 loc4) 50)
	(= (fly-cost loc1 loc5) 202)
	(= (fly-cost loc1 loc6) 22)
	(= (fly-cost loc1 loc7) 156)
	(= (fly-cost loc2 depot) 183)
	(= (fly-cost loc2 loc1) 91)
	(= (fly-cost loc2 loc3) 155)
	(= (fly-cost loc2 loc4) 102)
	(= (fly-cost loc2 loc5) 122)
	(= (fly-cost loc2 loc6) 80)
	(= (fly-cost loc2 loc7) 70)
	(= (fly-cost loc3 depot) 185)
	(= (fly-cost loc3 loc1) 150)
	(= (fly-cost loc3 loc2) 155)
	(= (fly-cost loc3 loc4) 101)
	(= (fly-cost loc3 loc5) 170)
	(= (fly-cost loc3 loc6) 131)
	(= (fly-cost loc3 loc7) 165)
	(= (fly-cost loc4 depot) 232)
	(= (fly-cost loc4 loc1) 50)
	(= (fly-cost loc4 loc2) 102)
	(= (fly-cost loc4 loc3) 101)
	(= (fly-cost loc4 loc5) 189)
	(= (fly-cost loc4 loc6) 35)
	(= (fly-cost loc4 loc7) 153)
	(= (fly-cost loc5 depot) 65)
	(= (fly-cost loc5 loc1) 202)
	(= (fly-cost loc5 loc2) 122)
	(= (fly-cost loc5 loc3) 170)
	(= (fly-cost loc5 loc4) 189)
	(= (fly-cost loc5 loc6) 185)
	(= (fly-cost loc5 loc7) 56)
	(= (fly-cost loc6 depot) 235)
	(= (fly-cost loc6 loc1) 22)
	(= (fly-cost loc6 loc2) 80)
	(= (fly-cost loc6 loc3) 131)
	(= (fly-cost loc6 loc4) 35)
	(= (fly-cost loc6 loc5) 185)
	(= (fly-cost loc6 loc7) 141)
	(= (fly-cost loc7 depot) 120)
	(= (fly-cost loc7 loc1) 156)
	(= (fly-cost loc7 loc2) 70)
	(= (fly-cost loc7 loc3) 165)
	(= (fly-cost loc7 loc4) 153)
	(= (fly-cost loc7 loc5) 56)
	(= (fly-cost loc7 loc6) 141)
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
	(has-content person2 food)
	(has-content person3 food)
	(has-content person4 medicine)
	(has-content person6 medicine)
	(has-content person7 food)
	(has-content person7 medicine)
	))
(:metric minimize (total-time))
)
