class StaticPagesController < ApplicationController
  def home
 
@topics = Topic.all
@questions = Question.all
  end

  def help

  end

  def about
   end

  def contact
  end
end
