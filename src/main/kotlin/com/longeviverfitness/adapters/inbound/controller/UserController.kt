package com.longeviverfitness.adapters.inbound.controller

import com.longeviverfitness.adapters.converter.Converter
import com.longeviverfitness.adapters.dto.UserDTO
import com.longeviverfitness.application.mapper.UserMapper
import com.longeviverfitness.ports.input.UserServicePort
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import lombok.RequiredArgsConstructor
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Tag(name = "Usuário")
class UserController {

    @Autowired
    private lateinit var service: UserServicePort

    @GetMapping("/v1/{id}")
    @Operation(summary = "Find user by ID", description = "Returns a single user")
    fun userById(@PathVariable id: Long): ResponseEntity<UserDTO> =
        ResponseEntity.status(HttpStatus.OK).body(
            service.getById(id)?.let {
                Converter.toModel(it, UserDTO::class.java)
            }
        )

    @PostMapping("/v1/save")
    @Operation(summary = "Save a user", description = "Returns a single user create")
    fun save(@RequestBody userDTO: UserDTO): ResponseEntity<Any> =
        ResponseEntity.status(HttpStatus.CREATED).body(
            service.save(Converter.toModel(userDTO, UserMapper::class.java))
        )
}