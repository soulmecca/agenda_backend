class Api::PeopleController < ApplicationController
  protect_from_forgery with: :null_session, if: ->{request.format.json?}

  def new
      @person = Person.new
    end

    def create
      puts('######################')
      puts('CREATE')
      @person = Person.new(person_params)
        if @person.save
          render json: @person, status: 201
        else
          render json: {status: "There is an error"}
        end
    end

    def update
      puts('######################')
      puts('UPDATE')     
      @person = Person.find(params[:id])
        if @person.update(person_params)
          render json: @person, status: 200
        else
          render json: {status: "Failed to update person"}
        end
    end

    def show
      puts('######################')
      puts('SHOW')      
      # @person = Person.find(params[:id])
    end

    def destroy     
      @person = Person.find(params[:id])
      @person.destroy
      render json: {result: "info is destroyed"}, status: 200
    end

    private
      def person_params
        params.require(:person).permit(:name, :phone)
      end

end