# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "pry-byebug"

Question.delete_all

def chop_first_two_chars(string)
  string[0..1] = ''
  string
end

chapters_and_modules = [Array(1..6), Array(1..7), Array(1..6), Array(1..5), Array(1..3)]
text = ""

chapters_and_modules.each_with_index do |array, chapter_number|
  array.each do |module_number|
    end_of_files = chapter_number + 1 == 5 && module_number == 3
    File.open("db/#{chapter_number + 1}. fejezet/#{module_number}. modul/txt/quiz.txt", "r") do |f|
      f.each_line do |line|
        if line[0] != "−" && line[0] != "×" && line[0] != "\n"
          new_line = line[0..(line.size - 2)]
          text += new_line + " (#{chapter_number + 1}.#{module_number})\n"
        else
          line = chop_first_two_chars(line) if line != "\n"
          text += line
        end
      end
    end
    unless end_of_files
      text += "\n"
    end
  end
end

text.split("\n\n").each_with_index do |q, i|
  lines = q.split("\n")
  question = lines.first
  answers = lines[1..(lines.size - 1)]
  Question.create(
    question: question[0..-7],
    answers: answers,
    correct_answer: answers.first,
    chapter: question[-4].to_i,
    module: question[-2].to_i,
    contains_image: question[0] == "["
  )
  question[0] == "[" ? suffix = " (img)" : suffix = ""
    puts "created question #{i + 1}#{suffix}"
end

# text = ""
# File.open("1. fejezet/1. modul/txt/quiz.txt") do |f|
#   f.each_line do |line|
#     text += line
#   end
# end
