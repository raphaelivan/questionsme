# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:pt] =  "%d-%m-%Y"
Time::DATE_FORMATS[:pt_time] =  "%d-%m-%Y %H:%M"
Time::DATE_FORMATS[:time] =  "%H:%M"
Date::DATE_FORMATS[:pt] =  "%d-%m-%Y"
Date::DATE_FORMATS[:en] = "%Y-%m-%d"
Date::DATE_FORMATS[:pt_moth_year] =  "%m-%Y"
Date::DATE_FORMATS[:pt_moth_day] =  "%d-%m"
Date::DATE_FORMATS[:pt_time] =  "%d-%m-%Y %H-%M"