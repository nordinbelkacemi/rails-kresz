class Question < ApplicationRecord
  serialize :answers, Array
end
