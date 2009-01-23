A Slightly Less Simple Standards-Based Slide Show System
========================================================

Create a [S5](1) slide show with [Markdown](2).

## Requirements

* [Ruby](3) for all the magic
* [Rake](4) for building stuff
* [Haml](5) for page skeleton
* [Ultraviolet](6) for code highlighting
* [Maruku](7) for Markdown interpretation

## Setup

* Install requirements (duh! ;-)
* Run `rake uv_init` to let Ultraviolet generate CSS for installed TextMate bundles
* Edit `skeleton.haml` and put your own title, metadata and footer in it
* Write your slides into `slides.markdown`
* ???
* PROFIT!

## Usage

### Delimiting slides

Slides are delimited by lines containing `+-- {.slide}` and `=--`. Example:

	+-- {.slide}
	# A normal slide with some bullets

	1.	Lorem ipsum dolor sit amet
	2.	Consectetuer adipiscing elit
	3.	???s
	4.	PROFIT!
	=--
	
### Highlight code

Highlighted code blocks are started by `!code:$LANG` and goes on until the first line that has less indentation than the first line of code. Example:

<pre><code>
!code:ruby
	def foo(bar)
	  {:hello => :world}.merge(bar)
	end
 	
	def baz(kazonk)
	  return kazonk
	end
	
	foo(:bar)

Some text
</code></pre>

### Generate slideshow

Just run `rake` in the working directory and the slides will be assembled by the magic of Rake. When the gremlins are done, the presentation would be in `index.html`.


[1]: http://meyerweb.com/eric/tools/s5/
[2]: http://daringfireball.net/projects/markdown/
[3]: http://ruby-lang.org/
[4]: http://rake.rubyforge.org/
[5]: http://haml.hamptoncatlin.com/
[6]: http://ultraviolet.rubyforge.org/
[7]: http://maruku.rubyforge.org/