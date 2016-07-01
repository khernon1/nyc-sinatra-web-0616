class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles


  # def landmark_name=(name)
  #   landmark = Landmark.find_or_create_by(name: name)
  #    self.landmark = landmark
  # end

  # def figure_name=(name)
  #     figure = Figure.find_or_create_by(name: name)
  #      self.figure = figure
  # end  
  
end