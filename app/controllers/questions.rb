get '/questions' do

  @questions = Question.all
  erb :'questions/index'

end

get '/questions/new' do
  if logged_in?
    erb :'questions/new'
  else
    @errors = ["Please login to post a question."]
    erb :"/users/login"
  end
end

post '/questions' do
  #below works with properly formatted params in HTML form
  @question = Question.new(params[:question]) #create new question
  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    @errors = @question.errors.full_messages
    erb :'questions/new' # show new questions view again(potentially displaying errors)
  end

end

get '/questions/:id' do

  #gets params from url

  @question = Question.find(params[:id]) #define instance variable for view
  @answers = Answer.where(question_id: @question.id)
  erb :'questions/show' #show single question view

end

get '/questions/:id/edit' do

  @form_action = "/question/params[:id] "
  #get params from url
  @question = Question.find(params[:id]) #define intstance variable for view

  erb :'questions/edit' #show edit question view

end

put '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define variable to edit

  @question.assign_attributes(params[:question]) #assign new attributes

  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :'questions/edit' #show edit question view again(potentially displaying errors)
  end

end

delete '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define question to delete

  @question.destroy #delete question

  redirect '/questions' #redirect back to questions index page

end

