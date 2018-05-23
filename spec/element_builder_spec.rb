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
  
  
end
