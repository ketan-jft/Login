package com

class Register {
    String fullName
    String emailId
    String mobile
    String userId
    String password
    static constraints = {
        fullName(nullable: false)
        emailId(email: true, nullable: false, unique: true)
        mobile(nullable: false)
        userId(unique: true, nullable: false)
        password(nullable: false,password: true)
    }
}
