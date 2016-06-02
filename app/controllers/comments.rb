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
