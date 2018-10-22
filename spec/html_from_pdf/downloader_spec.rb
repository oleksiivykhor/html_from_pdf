RSpec.describe HtmlFromPdf::Downloader do
  context 'when given url is not valid' do
    let(:url) { 'http://fake-url.com' }

    it 'returns nil' do
      expect(described_class.download(url)).to be_nil
    end
  end

  context 'when given url is valid' do
    let(:url) do
      'https://www.adobe.com/support/products/enterprise/knowledgecenter/'\
        'media/c4611_sample_explain.pdf'
    end

    it 'downloads pdf and returns its path' do
      pdf_file = described_class.download(url)
      expect(File.exist?(pdf_file)).to be_truthy
    end
  end
end
