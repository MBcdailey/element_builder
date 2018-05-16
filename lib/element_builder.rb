module ElementBuilder
  
  def self.build_doctype
    "<!Doctype html>"
  end
  
  def self.element_format(tag)
    %w(area base br col hr img input link meta param command keygen source).include?(tag) ? "<%s%s>" : "<%s%s>%s</%s>"
  end
  
  def self.element_attribute_format(attr)
    %w(async autocomplete autofocus autoplay border challenge checked compact contenteditable controls default defer disabled formNoValidate frameborder hidden indeterminate ismap loop multiple muted nohref noresize noshade novalidate nowrap open readonly required reversed scoped scrolling seamless selected sortable spellcheck translate).include?(attr.to_s) ? "%s" : "%s=\"%s\""
  end
  
  def self.build_attrs(attrs)
    attrs.map { |k,v| format(self.element_attribute_format(k), k, v) }.join(" ")
  end

  def self.build_element(tag, attrs, content)
    content = content.class == Array ? self.create_html(content) : content
    content = content.class == Hash ? build_element(content[:tag],content[:attrs],content[:content]) : content
    format(self.element_format(tag), tag, attrs.nil? ? '' : ' ' + build_attrs(attrs), content.nil? ? '' : content, tag)
  end

  def self.create_html(arr, include_doctype = false)
    tmp_html = include_doctype ? self.build_doctype : ""
    arr.each { |i| tmp_html += self.build_element(i[:tag], i[:attrs], i[:content]) }
    tmp_html
  end
  
end
