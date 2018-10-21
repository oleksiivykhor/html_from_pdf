# HtmlFromPdf

Simple wrapper for pdf2htmlEX for converting pdf to html

## Installation

For using this gem you should to install [pdf2htmlEX](https://github.com/coolwanglu/pdf2htmlEX/wiki/Building)

Add this line to your application's Gemfile:

```ruby
gem 'html_from_pdf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install html_from_pdf

## Usage

```ruby
HtmlFromPdf.convert('sample.pdf', 'path/to/html.html', options: { zoom: 1.5 })
```
Path to html is optional
```ruby
HtmlFromPdf.convert('sample.pdf', options: { zoom: 1.5 })
```

#### Allowed options:

```ruby
first_page:              --first-page
last_page:               --last-page
zoom:                    --zoom
fit_width:               --fit-width
fit_height:              --fit-height
use_cropbox:             --use-cropbox
hdpi:                    --hdpi
vdpi:                    --vdpi
embed:                   --embed
embed_css:               --embed-css
embed_font:              --embed-font
embed_image:             --embed-image
embed_javascript:        --embed-javascript
embed_outline:           --embed-outline
split_pages:             --split-pages
dest_dir:                --dest-dir
css_filename:            --css-filename
page_filename:           --page-filename
outline_filename:        --outline-filename
process_nontext:         --process-nontext
process_outline:         --process-outline
process_annotation:      --process-annotation
process_form:            --process-form
printing:                --printing
fallback:                --fallback
tmp_file_size_limit:     --tmp-file-size-limit
embed_external_font:     --embed-external-font
font_format:             --font-format
decompose_ligature:      --decompose-ligature
auto_hint:               --auto-hint
external_hint_tool:      --external-hint-tool
stretch_narrow_glyph:    --stretch-narrow-glyph
squeeze_wide_glyph:      --squeeze-wide-glyph
override_fstype:         --override-fstype
process_type3:           --process-type3
heps:                    --heps
veps:                    --veps
space_threshold:         --space-threshold
font_size_multiplier:    --font-size-multiplier
space_as_offset:         --space-as-offset
tounicode:               --tounicode
optimize_text:           --optimize-text
correct_text_visibility: --correct-text-visibility
bg_format:               --bg-format
svg_node_count_limit:    --svg-node-count-limit
svg_embed_bitmap:        --svg-embed-bitmap
owner_password:          --owner-password
user_password:           --user-password
no_drm:                  --no-drm
clean_tmp:               --clean-tmp
tmp_dir:                 --tmp-dir
data_dir:                --data-dir
debug:                   --debug
proof:                   --proof
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [html_from_pdf](https://github.com/oleksiivykhor/html_from_pdf). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
