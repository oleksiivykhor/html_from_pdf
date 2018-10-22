module HtmlFromPdf
  class Downloader
    extend HtmlFromPdf::Helpers

    def self.download(url)
      return unless valid_url? url

      file_path = default_file_path(:pdf)
      dir_path = File.split(file_path).first
      create_dir dir_path
      File.open(file_path, 'wb') do |file|
        file.write open(url).read
      end
      file_path
    end

    class << self
      private

      def valid_url?(url)
        regex = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}
                 (([0-9]{1,5})?\/.*)?$/ix
        return false unless url[regex]

        open(url).status.include?('200')
      rescue SocketError
        false
      end
    end
  end
end
