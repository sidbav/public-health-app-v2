class Question < ApplicationRecord
  def option_points_list_array
    option_points_list.split(',').map(&:to_i)
  end
end
