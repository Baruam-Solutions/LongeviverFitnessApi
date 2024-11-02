package com.longeviverfitness.adapters.outbound.repository

import com.longeviverfitness.adapters.model.UserModel
import org.springframework.data.jpa.repository.JpaRepository

interface UserRepository : JpaRepository<UserModel, Long> {
}