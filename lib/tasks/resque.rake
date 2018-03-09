require 'resque/tasks'

# Load the environment
task "resque:setup" => :environment
