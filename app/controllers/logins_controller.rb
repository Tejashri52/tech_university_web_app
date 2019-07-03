class LoginsController < ApplicationController
    #before_filter :find_model

    skip_before_action :require_user, only: [:new, :create]
    def new

    end
    def create
        student = Student.find_by(email:params[:logins][:email].downcase)
        if student && student.authenticate(params[:logins][:password])
            session[:student_id] = student.id
            flash[:notice] ="Successfully logged in"
            redirect_to student
        else
            flash.now[:notice]="invalid email and password"
            render 'new'
        end
    end
    def destroy
        session[:student_id] = nil
        flash[:notice] = "you have successfully logged out"
        redirect_to root_path
    end

    private
    def find_model
        @model = Logins.find(params[:id]) if params[:id]
    end
end
