class StudentsController < ApplicationController
    #before_filter :find_model
    before_action :set_student, only: [:show,:edit,:update]
    def index
        @students = Student.all

    end
    def show

    end

    def new
        @student = Student.new
    end

    def create
        #byebug
        @student = Student.new(student_params)
        if @student.save
            flash[:notice]= "You have successfully signed up"
            redirect_to @student

        else
            render 'new'
        end

    end
    def edit

    end

    def update

        if @student.save
            flash[:notice]= "You have successfully edit your profile"
            #redirect_to student_path(@student)
            redirect_to @student
        else
            render 'edit'
        end
    end

    private
    def set_student
        @student = Student.find(params[:id])
    end
    def student_params
        params.require(:student).permit(:name,:email, :password, :password_confirmation)

    end
    def find_model
        @model = Students.find(params[:id]) if params[:id]
    end



end
