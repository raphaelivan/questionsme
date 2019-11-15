module ApplicationHelper
  def yes_or_no resp
    resp ? 'SIM' : 'NÃO'
  end


  def delete_or_cancel f,textSubmit = "Deletar", url = nil
    div = "<button type='submit' class='btn btn-danger'>"
    div += "<span class='fa fa-trash'> </span> #{textSubmit}"
    div += "</button> "
    div += link_to "Voltar" , url|| url_for(controller: controller.controller_name , action: 'index') , class: "btn btn-info"
  end
end
