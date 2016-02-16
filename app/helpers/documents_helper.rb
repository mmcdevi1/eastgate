module DocumentsHelper

  def icon_for_document(document)
    case
    when document.extname == '.pdf'
      'pdf'
    when document.extname == '.docx' || document.extname == '.doc'
      'word'
    when document.extname == '.ppt' || document.extname == '.pptx'
      'powerpoint'
    when document.extname == '.xlsx' || document.extname == '.xls'
      'excel'
    when document.extname == '.css'
      'css'
    when document.extname == '.zip'
      'zip'
    end
  end

end
