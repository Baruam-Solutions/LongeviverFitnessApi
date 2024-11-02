package com.longeviverfitness.ports.input

import com.longeviverfitness.application.mapper.UserMapper

interface UserServicePort {
    fun save(userMapper: UserMapper): UserMapper

    fun getById(id: Long): UserMapper?
}