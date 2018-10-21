RSpec.describe HtmlFromPdf::Converter do
  let(:pdf_path) { File.join(fixtures_path, 'sample.pdf') }
  let(:converter) { described_class.new(pdf_path, nil) }

  context 'when something went wrong during converting' do
    before do
      allow(converter).to receive(:system).and_return(false)
    end

    it 'raises HtmlFromPdf::ConvertingError' do
      expect { converter.convert }.to raise_error HtmlFromPdf::ConvertingError
    end
  end

  it 'converts pdf when html path and dest_dir are not specified' do
    expect { converter.convert }.to_not raise_error
  end

  context 'when dest_dir is specified' do
    let(:dest_dir) { '/tmp/html_from_pdf' }

    context 'but html path is not specified' do
      let(:converter) { described_class.new(pdf_path, nil, { dest_dir: dest_dir }) }
      let(:html_path) { File.join(dest_dir, 'sample.html') }

      it 'converts pdf into dest dir' do
        expect { converter.convert }.to_not raise_error
        expect(File.exist?(html_path)).to be_truthy
      end
    end

    context 'and html path is specified' do
      let(:html_path) { 'test.html' }
      let(:full_html_path) { File.join(dest_dir, html_path) }
      let(:converter) { described_class.new(pdf_path, html_path, { dest_dir: dest_dir }) }

      it 'converts pdf into dest dir' do
        expect { converter.convert }.to_not raise_error
        expect(File.exist?(full_html_path)).to be_truthy
      end
    end
  end

  context 'when html path is specified and dest_dir is not specified' do
    let(:html_path) { '/tmp/html_from_pdf/test.html' }
    let(:converter) { described_class.new(pdf_path, html_path) }

    it 'converts pdf into html path' do
      expect { converter.convert }.to_not raise_error
      expect(File.exist?(html_path)).to be_truthy
    end
  end

  context 'when options hash has a wrong option' do
    let(:converter) { described_class.new(pdf_path, nil, { wrong_key: '' }) }

    it 'raises HtmlFromPdf::UnrecognizedOption' do
      expect { converter.convert }.to raise_error HtmlFromPdf::UnrecognizedOption
    end
  end
end
