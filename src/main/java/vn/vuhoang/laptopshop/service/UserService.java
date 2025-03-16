package vn.vuhoang.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.vuhoang.laptopshop.repository.RoleRepository;
import vn.vuhoang.laptopshop.repository.UserRepository;
import vn.vuhoang.laptopshop.domain.Role;
import vn.vuhoang.laptopshop.domain.User;
import vn.vuhoang.laptopshop.domain.dto.RegisterDTO;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User user) {
        return userRepository.save(user);
    }

    public Page<User> getAllUser(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    public List<User> getUserByOneEmail(String email) {
        return userRepository.findOneByEmail(email);
    }

    public User getUserById(long id) {
        return userRepository.findById(id).orElse(null);
    }

    public void deleteUserById(long id) {
        userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return roleRepository.findByName(name);
    }

    public User registerDTO(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());

        return user;
    }

    public boolean checkEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}
