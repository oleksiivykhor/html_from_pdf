module HtmlFromPdf
  module Helpers
    def default_file_path(format = :html)
      file_name = "#{Time.now.strftime('%m_%d_%Y__%H_%M_%S')}.#{format}"
      File.join('/tmp/html_from_pdf', file_name)
    end

    def create_dir(dir_path)
      FileUtils.mkdir_p dir_path
    end
  end
end
