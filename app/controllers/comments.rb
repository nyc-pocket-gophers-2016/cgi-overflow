post '/questions/:id/comments' do
  @question = Question.find_by(id: params[:id])
  @comment = @question.comments.build(body: params[:body], user: current_user)
    if @comments.save
      #erb :'comment/new'
      redirect "/questions/#{@question.id}"
    else
      @error = "Your comment is invalid."
        erb :'/questions/#{@question.id}'
      end
end
