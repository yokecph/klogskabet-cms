namespace :deploy do
  namespace :unicorn do
    commands = %w(start stop reload)
    desc "Unicorn commands (#{commands.join(", ")})"
    commands.each do |command|
      task command.to_sym do
        on roles(:app), in: :sequence, wait: 5 do
          execute "systemctl #{command} <%= fetch(:application) %>-unicorn.service"
        end
      end
    end
  end

  namespace :resque do
    commands = %w(start stop)
    desc "Resque commands (#{commands.join(", ")})"
    commands.each do |command|
      task command.to_sym do
        on roles(:app), in: :sequence, wait: 5 do
          execute "systemctl #{command} <%= fetch(:application) %>-resque.service"
        end
      end
    end
  end
end
