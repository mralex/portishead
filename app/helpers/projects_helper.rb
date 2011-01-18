module ProjectsHelper

  def link_to_add_image(name, form)
    #image = form.object.class.reflect_on_association(:images).klass.new
    image = Image.new
  
    fields = form.semantic_fields_for(:images, image, :child_index => "new_image") do |i|
      render("image_attachment", :i => i)
    end
  
    link_to(name, "#", :class => "add_image", 'data-fields' => "<fieldset class=\"inputs\"><ol>#{fields}</ol></fieldset>")
  end
  
  def link_to_add_link(name, form)
    #image = form.object.class.reflect_on_association(:images).klass.new
    link = Link.new
  
    fields = form.semantic_fields_for(:links, link, :child_index => "new_link") do |i|
      render("link_attachment", :i => i)
    end
  
    link_to(name, "#", :class => "add_link", 'data-fields' => "<fieldset class=\"inputs\"><ol>#{fields}</ol></fieldset>")
  end

end
