namespace :deploy do
  desc "Render and upload config files"
  task :config do
    on roles(:app) do
      # make the config dir
      execute :mkdir, "-p #{shared_path}/config"

      # config files to be uploaded to shared/config, see config_template.rb for details
      fetch(:config_files, []).each do |file|
        if test "[ -f '#{shared_path}/config/#{file}' ]"
          info "config/#{file} exists - skipping"
        else
          render_template_and_upload(file)
        end
      end

      info "Config files uploaded. Now edit and move/copy/link them as necessary"
    end
  end
end
