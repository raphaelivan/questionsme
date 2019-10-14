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

    @result = (@reply.reply_options.map(&:weight).sum - @reply.employee.years)
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
    redirect_to question_reply_path(@question, @reply)
  end
end
