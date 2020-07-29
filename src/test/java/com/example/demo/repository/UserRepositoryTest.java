package com.example.demo.repository;

import com.example.demo.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@DataJpaTest
public class UserRepositoryTest {
    @Autowired
    private UserRepository userRepository;

    @Test
    public void testWithEmptyUserId() {
        Optional<User> optionalUser = userRepository.findById(10);
        assertThat(optionalUser.isPresent()).isEqualTo(false);
    }
}
