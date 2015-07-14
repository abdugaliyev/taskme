# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Taskme::Application.initialize!
Time::DATE_FORMATS[:ru_datetime] = "%Y.%m.%d в %k:%M:%S"