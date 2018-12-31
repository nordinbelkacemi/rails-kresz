class PagesController < ApplicationController
  def home
    @questions = Question.all
  end

  def learn
    chapters_and_modules = [Array(1..6), Array(1..7), Array(1..6), Array(1..5), Array(1..3)]

    if params[:chapter].nil?
      @chapter_number = 1
    else
      @chapter_number = params[:chapter].to_i
    end
    @number_of_modules = chapters_and_modules[@chapter_number - 1].size
    @inactive_chapters = [1,2,3,4,5]
    @inactive_chapters.delete(@chapter_number)

    if params[:module].nil?
      @module_number = 1
    else
      @module_number = params[:module].to_i
    end
    puts @chapter_number
  end

  def quiz
    @questions = Question.all
  end

  def exam
    @questions = Question.all
  end
end
