package com.longeviverfitness.adapters.outbound

import com.longeviverfitness.adapters.converter.Converter
import com.longeviverfitness.adapters.model.UserModel
import com.longeviverfitness.adapters.outbound.repository.UserRepository
import com.longeviverfitness.application.mapper.UserMapper
import com.longeviverfitness.ports.output.UserPersistencePort
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional

@Component
class UserPersistenceAdapter : UserPersistencePort {

    @Autowired
    private lateinit var userRepository: UserRepository

    @Transactional(rollbackFor = [Throwable::class], propagation = Propagation.REQUIRES_NEW)
    override fun save(userModel: UserModel): UserMapper =
        Converter.toModel(userRepository.save(userModel), UserMapper::class.java)

    override fun getById(id: Long): UserMapper? =
        userRepository.findById(id).let {
            Converter.toModel(it, UserMapper::class.java)
        }
}