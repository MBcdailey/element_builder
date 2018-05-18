module ElementBuilder

    lib = File.expand_path('../lib', __FILE__)
    $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
    require 'element_builder/builder'
    
  def self.create_html(arr, include_doctype = false)
    builder = Builder.new
    builder.build_html(arr, include_doctype)
  end
  
end
