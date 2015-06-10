package x3.crm.address

import org.springframework.context.support.StaticApplicationContext

class Person {

    String surname
    String christianName
    String gender
    Date birthDate
    String placeOfBirth
    String nationality
    String title
    static hasMany = [addressings:Addressing]

    static constraints = {
        surname  (blank: false)
        christianName (blank: false)
        gender (inList: ['male','female'])
        birthDate  (blank: false)
        placeOfBirth  (blank: false)
        nationality  (blank: false)
        title  (blank: false)
    }

}
