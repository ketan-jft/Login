package com



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegisterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Register.list(params), model:[registerInstanceCount: Register.count()]
    }

    def show(Register registerInstance) {
        respond registerInstance
    }

    def create() {
        respond new Register(params)
    }

    @Transactional
    def save(Register registerInstance) {
        if (registerInstance == null) {
            notFound()
            return
        }

        if (registerInstance.hasErrors()) {
            respond registerInstance.errors, view:'create'
            return
        }

        registerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'register.label', default: 'Register'), registerInstance.id])
                redirect registerInstance
            }
            '*' { respond registerInstance, [status: CREATED] }
        }
    }

    def edit(Register registerInstance) {
        respond registerInstance
    }

    @Transactional
    def update(Register registerInstance) {
        if (registerInstance == null) {
            notFound()
            return
        }

        if (registerInstance.hasErrors()) {
            respond registerInstance.errors, view:'edit'
            return
        }

        registerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Register.label', default: 'Register'), registerInstance.id])
                redirect registerInstance
            }
            '*'{ respond registerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Register registerInstance) {

        if (registerInstance == null) {
            notFound()
            return
        }

        registerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Register.label', default: 'Register'), registerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'register.label', default: 'Register'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def login(){}

    def validate={
        def user=Register.findByUserIdAndPassword(params.userId,params.password)
        if(user)
        {
            session.setAttribute("userId",user.userId)
            flash.message="Hello ${user.fullName}"
            redirect(action: "index")
        }
        else {
            flash.message = "Sorry ! You have entered wrong Userid and Password"
            redirect(action: "login")
        }
    }
    def logout={
        session.invalidate()
        redirect(action: "login")
    }

    /*def beforeInterceptor = [action: this.&auth]

    def auth(){
        if(session.getAttribute("userId")!=null)
        {
            redirect(action:"index")
            return false
        }

    }*/
}
