# element_builder
Generates valid html from an array of hashes. Create a simple video tag or an entire HTML5 document.

## Getting Started

These instructions will get you a copy of the project up and running.

### Installing

First, clone and build the project into a gem. 

Build the gem.

```
gem build element_builder.gemspec
```

Install the gem.

```
gem install element_builder-1.0.0.gem
```

### Usage

Below is an example of how to use the gem.

Build an entire document by passing in true for the second optional parameter which generates the doctype.

```
require 'element_builder'

container_items = [
  {tag: 'html', attrs: nil, content: [
    {tag: 'head', attrs: nil, content: [
      {tag: 'link', attrs: {'rel': 'stylesheet', href: '/styles/main.css', 'media': 'all'}, content: nil},
      {tag: 'link', attrs: {'rel': 'stylesheet', href: '/styles/custom.css', 'media': 'all'}, content: nil}
    ]},
    {tag: 'body', attrs: nil, content: [
      {tag: 'div', attrs: {'id': 'main', class: 'wrapper main-wrapper'}, content: [
        {tag: 'h1', attrs: nil, content: 'Home Page'}
      ]}
    ]}
  ]}
]

html = ElementBuilder.create_html(container_items, true)
puts html
```

Or, build a snippet.

```
require 'element_builder'

container_items = [
      {tag: 'video', attrs: {'id': 'video1', class: 'video', src: 'https://videostore.com/video2.mp4'}}
]

html = ElementBuilder.create_html(container_items)
puts html
```


