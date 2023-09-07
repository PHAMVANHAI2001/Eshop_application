//package com.eshop.app.api;
//
//import com.eshop.app.services.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/api/v1/user")
//public class UserApi {
//    @Autowired
//    private UserService userService;
//    @GetMapping("/get-username/{username}")
//    public ResponseEntity<?> getUsername(@PathVariable String username) {
//        return ResponseEntity.ok(userService.findByUsername(username));
//    }
//}
