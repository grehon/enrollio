package org.bworks.bworksdb.auth

class ShiroUser {
    String username
    String firstName
    String lastName
    String passwordHash
    String passwordConfirm
    String password

    static transients = ['passwordConfirm', 'password']

    static constraints = {
        username(nullable: false, blank: false)
        firstName(nullable:false, blank:false)
        lastName(nullable:false, blank:false)
        password(validator: { val, obj ->
            if(val.equals(obj.passwordConfirm)) {
                return true
            }
            return 'user.password.mustmatch.confirmation'
        })
    }
}
