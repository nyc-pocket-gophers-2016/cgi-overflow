get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
 if logged_in?
    erb :'answers/new'
  else
    @errors = ["Please login to post an answer."]
    erb :"/users/login"
  end
end

post '/questions/:id/answers' do
  answer = Answer.new(params[:answer])
  answer.user_id = session[:user_id]
  answer.question_id = params[:id]
    if answer.save
     redirect "/questions/#{answer.question.id}"
   else
     erb :'/answers/new'
   end
end

get '/answers/:id/edit' do

  @form_action = "/answers/params[:id] "
  #get params from url
  @answers = Answer.find(params[:id]) #define intstance variable for view

  erb :'answers/edit' #show edit question view

end

# put '/questions/:id' do

#   #get params from url
#   @question = Question.find(params[:id]) #define variable to edit

#   @question.assign_attributes(params[:question]) #assign new attributes

#   if @question.save #saves new question or returns false if unsuccessful
#     redirect '/questions' #redirect back to questions index page
#   else
#     erb :'questions/edit' #show edit question view again(potentially displaying errors)
#   end

# end

# delete '/questions/:id' do

#   #get params from url
#   @question = Question.find(params[:id]) #define question to delete

#   @question.destroy #delete question

#   redirect '/questions' #redirect back to questions index page

# end
