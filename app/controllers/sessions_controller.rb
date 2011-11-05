class SessionsController < ApplicationController
  def create
    session[:access_token] = '28430602-a5F6mvn4FafyxbL9tu7rezTq2GuRvQaQ5QXqjZq2x'
    session[:acess_secret] = 'HwJ4sV7hpOvIGcvvVssOLTywxjwATKHpCJYooPFF7U'
    redirect_to root, :notice => "Logat prin twitter'
  end
end
