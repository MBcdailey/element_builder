#  test.rb
#  
#  Copyright 2018 Chad Dailey <cdailey@cdailey-VirtualBox>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

require 'element_builder'

#container_items = [
#  {tag: 'p', attrs: {id: 'ptag1', class: 'color-11'}, content: 'Yesterday was a good day!'},
#  {tag: 'div', attrs: {id: 'wrapper1', class: 'wrapper'}, content: {tag: 'p', attrs: {id: 'ptag1', class: 'color-12 size-large'}, content: 'Today was a good day!' }},
#  {tag: 'p', attrs: {id: 'ptag1', class: 'color-11' }, content: 'Tomorrow will be a good day!'},
#  {tag: 'input', attrs: {id: 'hiddentag1', type: 'hidden' }, content: nil}
#]

container_items = [
  {tag: '!Doctype html'},
  {tag: 'html', attrs: nil, content: [
    {tag: 'head', attrs: nil, content: nil},
    {tag: 'body', attrs: nil, content: nil}
  ]}
]

html = ElementBuilder.create_html(container_items)
puts html

