get '/questions/:id/comments/new' do
  @question = Question.find_by(id: params[:id])
  if logged_in?
    if request.xhr?
      erb :'comments/question-comments',layout: false
    else
      erb :'comments/question-comments'
    end
  else
    redirect '/login'
  end
end

post '/questions/:id/comments' do
  @question = Question.find_by(id: params[:id])
  @comment = @question.comments.new(comment: params[:comment], user_id: session["user_id"])
    if @comment.save
      if request.xhr?
        @comment.comment
      else
      #erb :'comment/new'
      redirect "/questions/#{@question.id}"
      end
    else
      @error = "Your comment is invalid."
      erb :'comments/question-comments'
    end
end

get '/answers/:id/comments/new' do
  @answer = Answer.find_by(id: params[:id])
   if request.xhr?
      erb :'comments/answer-comments',layout: false
    else
      erb :'comments/answer-comments'
    end
end

post '/answers/:id/comments' do
  @answer = Answer.find_by(id: params[:id])
  @comment = @answer.comments.new(comment: params[:comment], user_id: session["user_id"])
    if @comment.save
      if request.xhr?
        @comment.comment
      else
      #erb :'comment/new'
        redirect "/questions/#{@answer.question_id}"
      end
    else
      @error = "Your comment is invalid."
      erb :'comments/answer-comments'
    end
end

post '/comments/:id/upvote' do
  @question = Question.find_by(params[:question_id])
  @comment = Comment.find_by(id: params[:id])
  @upvote = @comment.votes.build(vote_value: 1, user_id: current_user.id)
  if @upvote.save
    if request.xhr?
      @comment.votes.sum(:vote_value).to_s
    else
      redirect "/questions/#{@question.id}"
    end
  else
    erb :'/question/show'
  end
end

post '/comments/:id/downvote' do
  @question = Question.find_by(params[:question_id])
  @comment = Comment.find_by( id: params[:id])
  @downvote = @comment.votes.build(vote_value: - 1, user_id: current_user.id)
  if @downvote.save
    if request.xhr?
      @comment.votes.sum(:vote_value).to_s
    else
      redirect "/questions/#{@question.id}"
    end
  else
    erb :'/question/show'
  end
end

get '/comments/:id' do
  erb :'404'
end
