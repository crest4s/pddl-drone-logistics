(define (domain drone-domain)
    (:requirements :strips :typing)

    (:types
        location drone box person content arm - object
    )

    (:predicates
        (at-drone ?d - drone ?l - location)
        (at-box ?b - box ?l - location)
        (at-person ?p - person ?l - location)
        (box-content ?b - box ?c - content)
        (has-content ?p - person ?c - content)
        (empty ?a - arm ?d - drone)
        (holding ?a - arm ?d - drone ?b - box)
        (available ?b - box)
    )

    (:action pick-up
        :parameters (?d - drone ?b - box ?l - location ?a - arm)
        :precondition (and
            (at-drone ?d ?l)
            (at-box ?b ?l)
            (empty ?a ?d)
            (available ?b)
        )
        :effect (and
            (holding ?a ?d ?b)
            (not (at-box ?b ?l))
            (not (empty ?a ?d))
        )
    )

    (:action drop
        :parameters (?d - drone ?b - box ?l - location ?a - arm)
        :precondition (and
            (holding ?a ?d ?b)
            (at-drone ?d ?l)
        )
        :effect (and
            (at-box ?b ?l)
            (empty ?a ?d)
            (not (holding ?a ?d ?b))
        )
    )

    (:action deliver
        :parameters (?d - drone ?p - person ?b - box ?l - location ?a - arm ?c - content)
        :precondition (and
            (at-drone ?d ?l)
            (at-person ?p ?l)
            (holding ?a ?d ?b)
            (box-content ?b ?c)
            (available ?b)
        )
        :effect (and
            (has-content ?p ?c)
            (empty ?a ?d)
            (not (holding ?a ?d ?b))
            (at-box ?b ?l)
            (not (available ?b))
        )
    )

    (:action fly
        :parameters (?d - drone ?from - location ?to - location)
        :precondition (and
            (at-drone ?d ?from)
        )
        :effect (and
            (at-drone ?d ?to)
            (not (at-drone ?d ?from))
        )
    )
)