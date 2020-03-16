class ChartController < ApplicationController
  def index
    def index
      gon.data = []
      6.times do
        gon.data << rand(100.0)
      end
    end
  end
end
