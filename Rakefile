$: << 'lib'

require 'fileutils'
require 'haml'
require 'uv'
require 'maruku'
require 'maruku/ext/div'
require 'maruku/ext/uv_code'

UV_THEME = ENV['UV_THEME'] || "blackboard"

task :default => 'index.html'

desc "Default: Generate presentation and write to index.html"
file 'index.html' => ['skeleton.haml', 'slides.markdown'] do |t|  
  skel = Haml::Engine.new(File.read(t.prerequisites[0]))
  slides = Maruku.new(File.read(t.prerequisites[1]))
  
  File.open(t.name, 'w') do |f|
    presentation = skel.render() do
      slides.to_html
    end
    
    f.write(presentation)
  end
end

desc "Initialize Ultraviolet"
task :uv_init do
  mkdir "uv"
  Uv.copy_files "xhtml", "uv"
end