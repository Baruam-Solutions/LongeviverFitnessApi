package com.longeviverfitness.adapters.inbound.controller

import com.longeviverfitness.application.mapper.UserMapper
import com.longeviverfitness.ports.input.UserServicePort
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.mockito.Mockito
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.test.mock.mockito.MockBean
import org.springframework.data.web.PageableHandlerMethodArgumentResolver
import org.springframework.http.MediaType
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder
import org.springframework.test.context.ActiveProfiles
import org.springframework.test.context.TestPropertySource
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders
import org.springframework.test.web.servlet.result.MockMvcResultMatchers
import org.springframework.test.web.servlet.setup.MockMvcBuilders
import org.springframework.web.servlet.View
import org.springframework.web.servlet.ViewResolver
import java.util.*

@SpringBootTest
@TestPropertySource(locations = ["classpath:application-test.yml"])
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("test")
class ProdutoAgricolControllerTest {

    @Autowired
    private lateinit var userController: UserController

    @MockBean
    private lateinit var service: UserServicePort

    private lateinit var mockMVC: MockMvc

    private lateinit var userMapper: UserMapper

    @BeforeEach
    fun setMockOutput() {
        mockMVC = MockMvcBuilders
            .standaloneSetup(userController)
            .setCustomArgumentResolvers(PageableHandlerMethodArgumentResolver())
            .setViewResolvers(object : ViewResolver {
                override fun resolveViewName(viewName: String, locale: Locale): View {
                    return Jackson2ObjectMapperBuilder().build()
                }
            })
            .build()

        userMapper = UserMapper(id = 1, name = "Longeviver Test")
    }

    @Test
    fun deveBuscarUserById() {
        Mockito.`when`(service.getById(any(Long::class.java))).thenReturn(userMapper)

        mockMVC.perform(
            MockMvcRequestBuilders.get("$URL_USER/1")
                .contentType(MediaType.APPLICATION_JSON)
                .characterEncoding("UTF-8")
        )
            .andExpect(MockMvcResultMatchers.status().isOk)
            .andExpect(MockMvcResultMatchers.jsonPath("$.id").value("1"))
            .andExpect(MockMvcResultMatchers.jsonPath("$.name").value("Longeviver Test"))
            .andExpect(MockMvcResultMatchers.status().is2xxSuccessful).andReturn()
    }

    private fun <T> any(type: Class<T>): T = Mockito.any<T>(type)
}

const val URL_USER = "/user/v1/"