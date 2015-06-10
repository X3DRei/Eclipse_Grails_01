package x3.crm.address



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AddressingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Addressing.list(params), model:[addressingInstanceCount: Addressing.count()]
    }

    def show(Addressing addressingInstance) {
        respond addressingInstance
    }

    def create() {
        respond new Addressing(params)
    }

    @Transactional
    def save(Addressing addressingInstance) {
        if (addressingInstance == null) {
            notFound()
            return
        }

        if (addressingInstance.hasErrors()) {
            respond addressingInstance.errors, view:'create'
            return
        }

        addressingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'addressing.label', default: 'Addressing'), addressingInstance.id])
                redirect addressingInstance
            }
            '*' { respond addressingInstance, [status: CREATED] }
        }
    }

    def edit(Addressing addressingInstance) {
        respond addressingInstance
    }

    @Transactional
    def update(Addressing addressingInstance) {
        if (addressingInstance == null) {
            notFound()
            return
        }

        if (addressingInstance.hasErrors()) {
            respond addressingInstance.errors, view:'edit'
            return
        }

        addressingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Addressing.label', default: 'Addressing'), addressingInstance.id])
                redirect addressingInstance
            }
            '*'{ respond addressingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Addressing addressingInstance) {

        if (addressingInstance == null) {
            notFound()
            return
        }

        addressingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Addressing.label', default: 'Addressing'), addressingInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'addressing.label', default: 'Addressing'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
