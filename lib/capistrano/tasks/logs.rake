namespace :logs do
  desc "Tail a log file"
  task :tail, :file do |t, args|
    if args[:file]
      on roles(:app) do
        execute "tail -f #{shared_path}/log/#{args[:file]}.log"
      end
    else
      puts "please specify a logfile e.g: 'cap logs:tail[logfile]'"
      puts "will tail 'shared_path/log/logfile.log'"
    end
  end
end
