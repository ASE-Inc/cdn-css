Encoding.default_external = "utf-8"
# Require any additional compass plugins here.
require 'bootstrap-sass'

# Set this to the root of your project when deployed:
css_dir = "_build"
sass_dir = "/"
images_dir = "images"
fonts_dir = "fonts"

http_path = "/"
http_stylesheets_path = "/"

if (environment == :production)
  sass_options = {
    :precision => 5,
    :sourcemap => true
  }
  output_style = :compressed
else
  sass_options = {
    :precision => 5,
    :debug_info => true
  }
  # You can select your preferred output style here (can be overridden via the command line):
  # output_style = :expanded or :nested or :compact or :compressed
  output_style = :nested
  # To disable debugging comments that display the original location of your selectors. Uncomment:
  # line_comments = false
end

enable_sourcemaps = true

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true
