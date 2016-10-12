class Api::PeopleController < ApplicationController
  
  def new
      @person = Person.new
    end

    def create
      binding.pry
      @person = Person.new(person_params)
        if @person.save
          render json: @person, status: 201
        else
          render json: {status: "There is an error"}
        end
    end

    def update
      @person = Person.find(params[:id])
        if @person.update(person_params)
          render json: @person, status: 200
        else
          render json: {status: "Failed ot update person"}
        end
    end

    def show
      @person = Person.find(params[:id])
    end

    def delete
      @person = Person.find(params[:id])
      @person.destroy
      render json: {result: "info is destroyed"}, status: 200
    end

    private
      def person_params
        params.require(:person).permit(:name, :phone)
      end

end