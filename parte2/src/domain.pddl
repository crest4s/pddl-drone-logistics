(define (domain drone-domain)
    (:requirements :strips :typing)

    (:types
        location drone box person content transporter num - object
    )

    (:predicates
        (at-drone ?d - drone ?l - location)
        (at-box ?b - box ?l - location)
        (at-person ?p - person ?l - location)
        (at-transporter ?t - transporter ?l - location)
        (in-transporter ?b - box ?t - transporter)
        (box-content ?b - box ?c - content)
        (has-content ?p - person ?c - content)
        (free-drone ?d - drone)
        (holding ?d - drone ?b - box)
        (available ?b - box)
        (siguiente ?n1 ?n2 - num)
        (transporter-count ?t - transporter ?n - num)
    )

    (:action pick-up
        :parameters (?d - drone ?b - box ?l - location)
        :precondition (and
            (at-drone ?d ?l)
            (at-box ?b ?l)
            (free-drone ?d)
            (available ?b)
        )
        :effect (and
            (holding ?d ?b)
            (not (at-box ?b ?l))
            (not (free-drone ?d))
        )
    )

    (:action drop
        :parameters (?d - drone ?b - box ?l - location)
        :precondition (and
            (holding ?d ?b)
            (at-drone ?d ?l)
        )
        :effect (and
            (at-box ?b ?l)
            (free-drone ?d)
            (not (holding ?d ?b))
        )
    )

    (:action deliver
        :parameters (?d - drone ?p - person ?b - box ?l - location ?c - content)
        :precondition (and
            (at-drone ?d ?l)
            (at-person ?p ?l)
            (holding ?d ?b)
            (box-content ?b ?c)
            (available ?b)
        )
        :effect (and
            (has-content ?p ?c)
            (free-drone ?d)
            (not (holding ?d ?b))
            (at-box ?b ?l)
            (not (available ?b))
        )
    )

    (:action move-transporter
        :parameters (?d - drone ?from - location ?to - location ?t - transporter)
        :precondition (and
            (at-drone ?d ?from)
            (at-transporter ?t ?from)
            (free-drone ?d)
        )
        :effect (and
            (at-drone ?d ?to)
            (not (at-drone ?d ?from))
            (at-transporter ?t ?to)
            (not (at-transporter ?t ?from))
        )
    )

    (:action load-onto-transporter
        :parameters (?d - drone ?b - box ?t - transporter ?l - location ?actual ?sig - num)
        :precondition (and
            (at-drone ?d ?l)
            (at-transporter ?t ?l)
            (holding ?d ?b)
            (transporter-count ?t ?actual)
            (siguiente ?actual ?sig)
        )
        :effect (and
            (in-transporter ?b ?t)
            (free-drone ?d)
            (not (holding ?d ?b))
            (transporter-count ?t ?sig)
            (not (transporter-count ?t ?actual))
        )
    )

    (:action unload-from-transporter
        :parameters (?d - drone ?b - box ?t - transporter ?l - location ?anterior ?actual - num)
        :precondition (and
            (at-drone ?d ?l)
            (at-transporter ?t ?l)
            (in-transporter ?b ?t)
            (transporter-count ?t ?actual)
            (siguiente ?anterior ?actual)
            (free-drone ?d)
        )
        :effect (and
            (not (in-transporter ?b ?t))
            (holding ?d ?b)
            (not (free-drone ?d))
            (transporter-count ?t ?anterior)
            (not (transporter-count ?t ?actual))
        )
    )
)