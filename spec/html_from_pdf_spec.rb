RSpec.describe HtmlFromPdf do
  let(:pdf_path) { File.join(fixtures_path, 'sample.pdf') }
  let(:html_path) { '/tmp/html_from_pdf/test_html_01.html' }
  let(:convert) { described_class.convert!(pdf_path, html_path, options: { zoom: 1.5 }) }

  it 'has a version number' do
    expect(HtmlFromPdf::VERSION).not_to be nil
  end

  it '#convert!' do
    expect { convert }.to_not raise_error
    expect(File.exist?(html_path)).to be_truthy
  end

  it 'raises HtmlFromPdf::PdfNotFound when pdf is not exists' do
    expect { described_class.convert!('/fake_path/fake_pdf') }.
      to raise_error HtmlFromPdf::PdfNotFound
  end

  context 'when given pdf path is url for pdf' do
    let(:pdf_path) do
      'https://www.adobe.com/support/products/enterprise/knowledgecenter'\
        '/media/c4611_sample_explain.pdf'
    end

    it 'downloads pdf and converts it to html' do
      expect { described_class.convert!(pdf_path, html_path) }.to_not raise_error
      expect(File.exist?(html_path)).to be_truthy
    end
  end

  context 'when something went wrong' do
    before do
      allow_any_instance_of(HtmlFromPdf::Converter).to receive(:convert).
        and_raise HtmlFromPdf::ConvertingError
    end

    it '#convert returns nil' do
      expect(described_class.convert(pdf_path, html_path)).to be_nil
      expect(File.exist?(html_path)).to be_falsey
    end
  end
end
