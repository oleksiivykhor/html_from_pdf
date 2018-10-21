RSpec.describe HtmlFromPdf do
  let(:pdf_path) { File.join(fixtures_path, 'sample.pdf') }
  let(:html_path) { '/tmp/html_from_pdf/test_html_01.html' }
  let(:convert) { described_class.convert(pdf_path, html_path, options: { zoom: 1.5 }) }

  it 'has a version number' do
    expect(HtmlFromPdf::VERSION).not_to be nil
  end

  it '#convert' do
    expect { convert }.to_not raise_error
    expect(File.exist?(html_path)).to be_truthy
  end

  it 'raises HtmlFromPdf::PdfNotFound when pdf is not exists' do
    expect { described_class.convert('/fake_path/fake_pdf') }.
      to raise_error HtmlFromPdf::PdfNotFound
  end
end
