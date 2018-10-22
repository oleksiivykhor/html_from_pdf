module HtmlFromPdf
  class Converter
    include HtmlFromPdf::Helpers

    def initialize(pdf_path, html_path, options = {})
      @pdf_path = pdf_path
      @html_path = html_path
      @options = options
    end

    def convert
      file_name = process_html_path
      command = "pdf2htmlEX #{options} #{@pdf_path} #{file_name}"
      raise HtmlFromPdf::ConvertingError unless system command
    end

    private

    def allowed_options
      yml_path = File.expand_path('../options.yml', __FILE__)
      YAML.load_file(yml_path)
    end

    def process_html_path
      case
      when @html_path && @options[:dest_dir]
        file_name = @html_path
      when @html_path && !@options[:dest_dir]
        @options[:dest_dir], file_name = File.split(@html_path)
      when !@html_path && @options[:dest_dir]
        file_name = nil
      else
        @options[:dest_dir], file_name = File.split(default_file_path)
      end
      file_name
    end

    def options
      result = ''
      @options.each do |key, value|
        option = allowed_options[key.to_s]
        raise HtmlFromPdf::UnrecognizedOption.new(key) unless option

        result += " #{option} #{value}"
      end

      result
    end
  end
end
