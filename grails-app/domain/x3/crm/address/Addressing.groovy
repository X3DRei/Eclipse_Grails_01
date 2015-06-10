package x3.crm.address

class Addressing {
    Person person
    String addressType
    String addressTerm
    Boolean isActice


    static constraints = {
        addressType inList:['email','FAX','Phone']
        addressTerm blank: false
        isActice nullable: true
    }
    String toString(){return addressType + ': '+ addressTerm}

}

