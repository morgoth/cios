class PeopleController < ApplicationController
  def index
    @coaches = Coach.all
    @boxers = Boxer.all
  end
end
