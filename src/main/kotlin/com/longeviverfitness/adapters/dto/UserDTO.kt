package com.longeviverfitness.adapters.dto

import io.swagger.v3.oas.annotations.media.Schema

data class UserDTO(
    @Schema(description = "Unique identifier of the user", example = "1", required = true)
    var id: Long? = null,

    @Schema(description = "Name of the user", example = "John Doe")
    var name: String? = null,
)