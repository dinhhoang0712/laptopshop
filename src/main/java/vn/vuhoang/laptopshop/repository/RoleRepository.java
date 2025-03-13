package vn.vuhoang.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.vuhoang.laptopshop.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);

}
