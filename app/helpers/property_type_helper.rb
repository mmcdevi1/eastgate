module PropertyTypeHelper

  def property_type_for_form(asset)
    if params[:action] == 'edit'
      asset.property_type ? PropertyType.title(asset) : 'Select'
    elsif params[:action] == 'new'
      'Select Property Type'
    end
  end

  def property_class_for_form(asset)
    if params[:action] == 'edit'
      asset.property_class ? PropertyClass.title(asset) : 'Select'
    elsif params[:action] == 'new'
      'Select Property Class'
    end
  end

  def states_for_form(client)
    if params[:action] == 'edit'
      client.state
    elsif params[:action] == 'new'
      'Select State'
    end
  end

end
