require 'html_from_pdf/version'
require 'byebug'
require 'yaml'
require 'html_from_pdf/exceptions'
require 'html_from_pdf/converter'

module HtmlFromPdf
  def self.convert(pdf_path, html_path = nil, options: {})
    raise HtmlFromPdf::PdfNotFound unless File.exist? pdf_path

    converter = HtmlFromPdf::Converter.new(pdf_path, html_path, options)
    converter.convert
  end
end
