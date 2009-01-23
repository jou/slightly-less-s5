require 'ruby-debug'

module MaRuKu; module Ext;
  class UvCode
    def self.register
      start_regex = /^\s*!code:([^:]+)\s*$/
      MaRuKu::In::Markdown::register_block_extension(
      	:regexp  => start_regex,
      	:handler => lambda { |doc, src, context|
  	      first_line = src.shift_line
  	      first_line =~ start_regex
  	      lang = $1
	      
  	      first_line_indent = src.cur_line.match(/^([\s]*)/)[1]
  	      lines = []
  	      
  	      while src.cur_line && src.cur_line =~ /^#{first_line_indent}/
  	        lines << src.cur_line.slice(first_line_indent.length, src.cur_line.length)
  	        src.shift_line
          end
          
          highlighted_source = Uv.parse(lines.join("\n"), "xhtml", lang, true, UV_THEME)
          # highlighted_source.sub!(/^<pre[^>]+>/m, '\0<[CDATA[').sub!(/<\/pre>$/m, ']]>\0')
          
          context.push doc.md_html(highlighted_source)
          
          return true
        }
      )
    end
  end
end; end

MaRuKu::Ext::UvCode.register