module ElementBuilder

  require_relative 'element_builder/builder'
  
  def self.create_html(arr, include_doctype = false)
    builder = Builder.new
    builder.build_html(arr, include_doctype)
  end
  
end
