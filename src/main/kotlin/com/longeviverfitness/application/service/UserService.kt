package com.longeviverfitness.application.service

import com.longeviverfitness.adapters.converter.Converter
import com.longeviverfitness.adapters.model.UserModel
import com.longeviverfitness.application.mapper.UserMapper
import com.longeviverfitness.ports.input.UserServicePort
import com.longeviverfitness.ports.output.UserPersistencePort
import lombok.RequiredArgsConstructor
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
@RequiredArgsConstructor
class UserService : UserServicePort {
    @Autowired
    private lateinit var userIntegrationPort: UserPersistencePort

    override fun save(userMapper: UserMapper): UserMapper =
        userIntegrationPort.save(Converter.toModel(userMapper, UserModel::class.java))

    override fun getById(id: Long): UserMapper? =
        userIntegrationPort.getById(id)
}