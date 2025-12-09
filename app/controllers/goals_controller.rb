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
            flash[:notice] = "Goal created successfully"
            redirect_to goals_path
        else
            render :goals_page, status: :unprocessable_entity
        end
    end
  
    private
  
      def goal_params
        params.require(:goal).permit(:goal_start, :goal_end, :goal_content)
    end
    

end
