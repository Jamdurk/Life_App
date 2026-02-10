class HobbiesController < ApplicationController

    def hobbies_page
        @hobby = Hobby.new
    end

    def create
        @hobby = Hobby.new(hobby_params)

        if @hobby.save
            flash[:notice] = "Hobby created successfully"
            redirect_to hobbies_path
        else
            render :hobbies_page, status: :unprocessable_entity
        end
    end

    def show 
        @hobby = Hobby.find_by(id: params[:id])
        
        if @hobby.nil?
            flash[:alert] = "Hobby doesn't exist!"
            redirect_to root_path
        end 
      end



    private 

    def hobby_params
        params.require(:hobby).permit(:start_date, :end_date, :hobby_content)
    end
end
