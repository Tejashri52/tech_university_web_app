class CoursesController < ApplicationController
  #  before_filter :find_model
  skip_before_action :require_user

    def index
        @courses = Course.all
    end

    def new

    end


    private
    def find_model
        @model = Courses.find(params[:id]) if params[:id]
    end
end
