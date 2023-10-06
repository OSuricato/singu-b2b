class SolutionsController < ApplicationController
  def index
    @solutions = Solution.all
  end

  def show
    @solution = Solution.find(params[:id])
  end
end
