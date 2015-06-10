package x3.crm.address



import grails.test.mixin.*
import spock.lang.*

@TestFor(AddressingController)
@Mock(Addressing)
class AddressingControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.addressingInstanceList
            model.addressingInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.addressingInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def addressing = new Addressing()
            addressing.validate()
            controller.save(addressing)

        then:"The create view is rendered again with the correct model"
            model.addressingInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            addressing = new Addressing(params)

            controller.save(addressing)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/addressing/show/1'
            controller.flash.message != null
            Addressing.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def addressing = new Addressing(params)
            controller.show(addressing)

        then:"A model is populated containing the domain instance"
            model.addressingInstance == addressing
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def addressing = new Addressing(params)
            controller.edit(addressing)

        then:"A model is populated containing the domain instance"
            model.addressingInstance == addressing
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/addressing/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def addressing = new Addressing()
            addressing.validate()
            controller.update(addressing)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.addressingInstance == addressing

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            addressing = new Addressing(params).save(flush: true)
            controller.update(addressing)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/addressing/show/$addressing.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/addressing/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def addressing = new Addressing(params).save(flush: true)

        then:"It exists"
            Addressing.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(addressing)

        then:"The instance is deleted"
            Addressing.count() == 0
            response.redirectedUrl == '/addressing/index'
            flash.message != null
    }
}
