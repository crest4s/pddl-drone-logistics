(define (domain drone-domain)
(:requirements :strips :typing)

(:types
    location
    drone
    box
    person
    content
)

(:predicates
    (at-drone ?d - drone ?l - location)
    (at-box ?b - box ?l - location)
    (at-person ?p - person ?l - location)
    (box-content ?b - box ?c - content)
    (has-content ?p - person ?c - content)
    (empty-left ?d - drone)
    (empty-right ?d - drone)
    (holding-left ?d - drone ?b - box)
    (holding-right ?d - drone ?b - box)
)

(:action pick-up-left
    :parameters (?d - drone ?b - box ?l - location)
    :precondition (and
        (at-drone ?d ?l)
        (at-box ?b ?l)
        (empty-left ?d)
    )
    :effect (and
        (holding-left ?d ?b)
        (not (at-box ?b ?l))
        (not (empty-left ?d))
    )
)

(:action pick-up-right
    :parameters (?d - drone ?b - box ?l - location)
    :precondition (and
        (at-drone ?d ?l)
        (at-box ?b ?l)
        (empty-right ?d)
    )
    :effect (and
        (holding-right ?d ?b)
        (not (at-box ?b ?l))
        (not (empty-right ?d))
    )
)

(:action drop-off-left
    :parameters (?d - drone ?b - box ?p - person ?l - location ?c - content)
    :precondition (and
        (at-drone ?d ?l)
        (at-person ?p ?l)
        (holding-left ?d ?b)
        (box-content ?b ?c)
    )
    :effect (and
        (has-content ?p ?c)
        (empty-left ?d)
        (not (holding-left ?d ?b))
    )
)

(:action drop-off-right
    :parameters (?d - drone ?b - box ?p - person ?l - location ?c - content)
    :precondition (and
        (at-drone ?d ?l)
        (at-person ?p ?l)
        (holding-right ?d ?b)
        (box-content ?b ?c)
    )
    :effect (and
        (has-content ?p ?c)
        (empty-right ?d)
        (not (holding-right ?d ?b))
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
