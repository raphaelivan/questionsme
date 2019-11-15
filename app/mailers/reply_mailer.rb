class ReplyMailer < ApplicationMailer 
  def reply_question(reply, question)
    @question = question
    @employee = reply.employee
    result = (reply.reply_options.map(&:weight).sum - @employee.years)

    @msg = 'Quando for igual' #quando for igual
    if result > 0 
      @msg = 'Quando for maior que a idade biologica' #quando for maior que a idade
    else 
      @msg = 'quando for menor que a idade biologica' #quando for menor
    end

    mail(
      to: @employee.email.to_s, 
      from: 'site@laborfit.com.br', 
      subject: "Veja o resultado da #{@question.name}"
    )
  end
end
