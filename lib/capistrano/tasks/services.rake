namespace :deploy do
  namespace :unicorn do
    task :reload do
      on roles(:app), in: :sequence, wait: 5 do
        # we sidestep systemd here, which isn't nice, but other solutions would
        # require not using systemd, breaking the server with a newer version of
        # polkit, or make deployer a passwordless sudoer... all gross
        if execute("test -f '#{shared_path}/tmp/pids/unicorn.pid'")
          execute "/bin/kill -s USR2 $(head -n 1 '#{shared_path}/tmp/pids/unicorn.pid')"
        else
          warn "Unicorn does not appear to be running"
        end
      end
    end
  end
end
