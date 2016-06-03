get '/questions/:id/comments/new' do
  @question = Question.find_by(id: params[:id])
  erb :'comments/question-comments'
end

post '/questions/:id/comments' do
  @question = Question.find_by(id: params[:id])
  @comment = @question.comments.new(comment: params[:comment], user_id: session["user_id"])
    if @comment.save
      #erb :'comment/new'
      redirect "/questions/#{@question.id}"
    else
      @error = "Your comment is invalid."
      erb :'comments/question-comments'
    end
end

get '/answers/:id/comments/new' do
  @answer = Answer.find_by(id: params[:id])
  erb :'comments/answer-comments'
end

post '/answers/:id/comments' do
  @answer = Answer.find_by(id: params[:id])
  @comment = @answer.comments.new(comment: params[:comment], user_id: session["user_id"])
    if @comment.save
      #erb :'comment/new'
      redirect "/questions/#{@answer.question_id}"
    else
      @error = "Your comment is invalid."
      erb :'comments/answer-comments'
    end
end

post '/comments/:id/up_votes' do
  @comment = Comment.find_by(params[:question_id])
  @question = Question.find_by(params[:question_id])
  @up_vote = @comment.votes.new(vote_value: + 1, user_id: current_user.id)
  if @up_vote.save
    if request.xhr?
      @comment.votes.sum(:vote_value).to_s
    else
      redirect "/questions/#{@question.id}"
    end
  else
    erb :'/question/show'
  end
end

post '/comments/:id/down_votes' do
  @question = Question.find_by(params[:question_id])
  @comment = Comment.find_by( id: params[:id])
  # binding.pry
  @down_vote = @comment.votes.new(vote_value: - 1, user_id: current_user.id)
  if @down_vote.save
    if request.xhr?
      @comment.votes.sum(:vote_value).to_s
    else
      redirect "/questions/#{@question.id}"
    end
  else
    erb :'/question/show'
  end
end
