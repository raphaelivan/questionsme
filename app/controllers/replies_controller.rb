class RepliesController < ApplicationController
  # GET /replies
  # GET /replies.json
  def index
    @question = Question.find_by_slug(params[:question_id])
    @replies = @question.replies
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @question = Question.find_by_slug(params[:question_id])
    @reply = @question.replies.find(params[:id])
    years = (@reply.employee.years * -1)
    age = @reply.reply_options.map(&:weight).sum
    @result = (age - years)
    puts "-" * 80
    puts age
    puts years
    puts "-" * 80
    if years < age
      render file: 'replies/greater'
    elsif years > age
      render file: 'replies/menor'
    else
      render file: 'replies/show'
    end
  end

  def delete
    @reply = Reply.find(params[:id])
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    
    redirect_to root_path
  end

  # GET /replies/new
  def new
    @question = Question.find_by_slug(params[:question_id])
    @reply = @question.replies.create!({ employee_id: current_employee.id, start_at: Time.now, open: true })
  end

  # GET /replies/1/edit
  def edit
    @question = Question.find_by_slug(params[:question_id])
    @reply = @question.replies.where('replies.employee_id = ?', current_employee.id).first
  end

  # POST /replies
  # POST /replies.json
  def create
    @question = Question.find_by_slug(params[:question])
    @reply = @question.replies.where('replies.employee_id = ?', current_employee.id).first
    asks = params.select{|x| x != 'utf8'}.select{|x| x != 'authenticity_token' }.select{|x| x != 'controller'}.select{|x| x != 'action'}.select{|x| x != 'question'}

    asks.keys.each_with_index do |ask, index|
      @reply.reply_options.create({option_id: asks[ask].to_i, ask_id: ask.to_i})
    end

    @reply.close!
    ReplyMailer.reply_question(@reply, @question).deliver_now
    redirect_to question_reply_path(@question, @reply)
  end
end
