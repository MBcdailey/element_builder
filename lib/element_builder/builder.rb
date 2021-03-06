class Builder

  DOCTYPE = "<!Doctype html>"
  ELEMENT_FORMAT = "<%s%s>%s</%s>"
  ELEMENT_FORMAT_SELF_CLOSING = "<%s%s>"
  ATTRIBUTE_FORMAT = "%s=\"%s\""
  ATTRIBUTE_FORMAT_BOOLEAN = "%s"
  EMPTY_STRING = ""
  SPACE = " "

  def build_html(arr, include_doctype = false)
    html = include_doctype ? build_doctype : EMPTY_STRING
    arr.each { |i| html += build_element(i[:tag], i[:attrs], i[:content]) if hash_contains_tag?(i) } if arr.class == Array
    html
  end
  
  private

  def build_doctype
    DOCTYPE
  end
  
  def element_format(tag)
    %w(area base br col hr img input link meta param command keygen source).include?(tag) ? ELEMENT_FORMAT_SELF_CLOSING : ELEMENT_FORMAT
  end
  
  def element_attribute_format(attr)
    %w(async autocomplete autofocus autoplay border challenge checked compact contenteditable controls default defer 
       disabled formNoValidate frameborder hidden indeterminate ismap loop multiple muted nohref noresize noshade 
       novalidate nowrap open readonly required reversed scoped scrolling seamless selected sortable spellcheck 
       translate playsinline).include?(attr.to_s) ? ATTRIBUTE_FORMAT_BOOLEAN : ATTRIBUTE_FORMAT
  end
  
  def build_attrs(attrs)
    attrs.map { |k,v| format(element_attribute_format(k), k, v) }.join(SPACE)
  end
  
  def handle_content(content)
    content = content.class == Array ? build_html(content) : content
    content = content.class == Hash ? build_element(content[:tag],content[:attrs],content[:content]) : content
  end

  def build_element(tag, attrs, content)
    format(element_format(tag), tag, attrs.class == Hash ? SPACE + build_attrs(attrs) : EMPTY_STRING, content.nil? ? EMPTY_STRING : handle_content(content), tag)
  end
  
  def hash_contains_tag?(hash)
    valid = false
    hash.each { |i| valid = true if hash.include?(:tag) }
    valid
  end
  
end
