require 'element_builder'

describe 'element_builder' do

  it 'returns <!Doctype html> if nil passed in for content and doctype flag is true' do
    expect(ElementBuilder.create_html(nil, true)).to eq '<!Doctype html>'
  end
  it 'returns <!Doctype html> if empty array passed in for content and doctype flag is true' do
    expect(ElementBuilder.create_html([], true)).to eq '<!Doctype html>'
  end
  it 'returns <!Doctype html> if hash does not contain at least one tag symbol and doctype flag is true' do
    expect(ElementBuilder.create_html([{bad: 'something', 2=>35}], true)).to eq '<!Doctype html>'
  end
  it 'returns \'\' if nil passed in for content and doctype flag is not set' do
    expect(ElementBuilder.create_html(nil)).to eq ''
  end
  it 'returns \'\' if empty array passed in for content and doctype flag is not set' do
    expect(ElementBuilder.create_html([])).to eq ''
  end
  it 'returns \'\' if hash does not contain at least one :tag symbol and doctype flag is not set' do
    expect(ElementBuilder.create_html([{bad: 'something', 2=>35}])).to eq ''
  end
  it 'returns <!Doctype html><html><head></head><body><h1 id="mainheading" class="class-abc">My Page</h1></body></html>' do
    expect(ElementBuilder.create_html([
      {tag: 'html', content: [
        {tag: 'head'},
        {tag: 'body', content: {tag: 'h1', attrs: {id: 'mainheading', class: 'class-abc'}, content: 'My Page'}}
      ]}
    ], true)).to eq '<!Doctype html><html><head></head><body><h1 id="mainheading" class="class-abc">My Page</h1></body></html>'
  end
  it 'returns <h1 id="mainheading" class="class-abc">My Page</h1><br><video src="/videos/abc.mp4" autoplay loop playsinline muted></video>' do
    expect(ElementBuilder.create_html([
      {tag: 'h1', attrs: {id: 'mainheading', class: 'class-abc'}, content: 'My Page'},
      {tag: 'br'},
      {tag: 'video', attrs: {src: '/videos/abc.mp4', autoplay: nil, loop: nil, playsinline: nil, muted: 'muted'}}
    ])).to eq '<h1 id="mainheading" class="class-abc">My Page</h1><br><video src="/videos/abc.mp4" autoplay loop playsinline muted></video>'
  end
  
end
