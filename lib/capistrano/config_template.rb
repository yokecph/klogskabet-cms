# Renders and uploads the given template file to shared/config on the server
# The template argument should be given without the .erb extension, and the
# remote_name argument is optional (if not given, template will be used)
# It'll search for the template file in:
#   config/deploy/<stage>/
#   config/deploy/shared/

def render_template_and_upload(template, remote_name = nil)
  template_path = begin
    templates = [
      "config/deploy/#{fetch :stage}/#{template}.erb",
      "config/deploy/shared/#{template}.erb"
    ]
    templates.detect { |path| File.exists?(path) }
  end

  if template_path
    upload_path = "#{shared_path}/config/#{remote_name || template}"
    payload = ERB.new(File.read(template_path)).result(binding)
    upload! StringIO.new(payload), upload_path
  else
    error "Error: Could not find template '#{template}'"
  end
end
