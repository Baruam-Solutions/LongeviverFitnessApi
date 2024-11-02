package com.longeviverfitness.adapters.model

import jakarta.persistence.*

@Entity
@Table(name = "users")
class UserModel(

    // TODO - Quando for desenvolver fazer com UUID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    var id: Long? = null,

    @Column(name = "name", nullable = false)
    var name: String? = null,
)