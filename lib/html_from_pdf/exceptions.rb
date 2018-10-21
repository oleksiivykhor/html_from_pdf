module HtmlFromPdf
  class PdfNotFound < StandardError
    def message
      'Given pdf was not found'
    end
  end

  class UnrecognizedOption < StandardError
    def initialize(option)
      @option = option
    end

    def message
      "Unrecognized option: #{@option}"
    end
  end

  class ConvertingError < StandardError
    def message
      'Something went wrong during converting'
    end
  end
end
