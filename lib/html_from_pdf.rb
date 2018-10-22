require 'html_from_pdf/version'
require 'byebug'
require 'yaml'
require 'open-uri'
require 'fileutils'
require 'html_from_pdf/helpers'
require 'html_from_pdf/exceptions'
require 'html_from_pdf/converter'
require 'html_from_pdf/downloader'

module HtmlFromPdf
  def self.convert(pdf_path, html_path = nil, options: {})
    convert_pdf_to_html(pdf_path, html_path, options)
  rescue
  end

  def self.convert!(pdf_path, html_path = nil, options: {})
    convert_pdf_to_html(pdf_path, html_path, options)
  end

  class << self
    private

    def convert_pdf_to_html(pdf_path, html_path, options)
      pdf_path = HtmlFromPdf::Downloader.download(pdf_path) || pdf_path
      raise HtmlFromPdf::PdfNotFound unless File.exist? pdf_path

      converter = HtmlFromPdf::Converter.new(pdf_path, html_path, options)
      converter.convert
    end
  end
end
