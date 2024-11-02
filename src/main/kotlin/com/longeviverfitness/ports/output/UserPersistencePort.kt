package com.longeviverfitness.ports.output

import com.longeviverfitness.adapters.model.UserModel
import com.longeviverfitness.application.mapper.UserMapper

interface UserPersistencePort {
    fun save(userModel: UserModel): UserMapper

    fun getById(id: Long): UserMapper?
}