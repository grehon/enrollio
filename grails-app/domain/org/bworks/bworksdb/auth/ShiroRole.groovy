package org.bworks.bworksdb.auth

class ShiroRole {
    String name

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
