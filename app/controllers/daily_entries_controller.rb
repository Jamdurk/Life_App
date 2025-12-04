class DailyEntriesController < ApplicationController

    def home 
        @daily_entry = DailyEntry.new
        @daily_entries = DailyEntry.order(date: :desc).limit(10)
    end

    def create
        @daily_entry = DailyEntry.new(daily_entry_params)
        if @daily_entry.save
            redirect_to home_path, notice: "Daily entry created successfully"
        else
            render :home, status: :unprocessable_entity
        end
    end

    private

    def daily_entry_params
        params.require(:daily_entry).permit(:date, :day_content, :mood)
    end

end
