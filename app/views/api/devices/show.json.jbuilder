json.partial! @content.to_partial_path, { :"#{@content.class.to_s.underscore}" => @content }
