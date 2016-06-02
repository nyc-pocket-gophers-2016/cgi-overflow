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
  @answer = Answer.find(params[:id]) #define intstance variable for view

  erb :'answers/edit' #show edit question view

end

put '/answers/:id' do

  #get params from url
  @answer = Answer.find(params[:id]) #define variable to edit

  @answer.assign_attributes(params[:answer]) #assign new attributes

  if @answer.save #saves new question or returns false if unsuccessful
    redirect "/questions/#{@answer.question_id}" #redirect back to questions index page
  else
    erb :'answers/edit' #show edit question view again(potentially displaying errors)
  end

end

delete '/answers/:id' do

  #get params from url
  @answer = Answer.find(params[:id]) #define question to delete

  @answer.destroy #delete question

  redirect "/questions/#{@answer.question_id}" #redirect back to questions index page

end
