class GoalsController < ApplicationController

    def goals_page
        @goal = Goal.new
    end

    def new
        @goal = Goal.new
    end

    def create
        @goal = Goal.new(goal_params)
        
        if @goal.save
            redirect_to root_path, notice: "Goal created successfully"
        else
            render :goals_page, status: :unprocessable_entity
        end
    end
  
    private
  
      def goal_params
        params.require(:goal).permit(:goal_start, :goal_end, :goal_content)
    end
    

end
