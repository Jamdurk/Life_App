class DailyEntriesController < ApplicationController

    def home 
        @daily_entry = DailyEntry.new
    end
    
    def create
        @daily_entry = DailyEntry.new(daily_entry_params)
        @daily_entry.date = Date.current
        
        if @daily_entry.save
            flash[:notice] = "Daily entry created successfully"
            redirect_to root_path
        else
            render :home, status: :unprocessable_entity
        end
    end

    private

    def daily_entry_params
        params.require(:daily_entry).permit(:date, :day_content, :mood)
    end

end 