class LoginsController < ApplicationController
    #before_filter :find_model
    def new

    end
    def create

    end
    def destroy

    end

    private
    def find_model
        @model = Logins.find(params[:id]) if params[:id]
    end
end
