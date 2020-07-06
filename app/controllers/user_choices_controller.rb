class UserChoicesController < ApplicationController
  def index
    @match = Match.find(params[:match_id])
    @choice = UserChoice.new
    @match.winner.nil? ? @match_winner = "Playing" : @match_winner = @match.winner
  end

  def create
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @match = Match.find(params[:match_id])
    @choice = UserChoice.new(choice: params[:user_choice][:choice], user: 1)
    @choice.match = @match
    @choice.save
    user_positions = UserChoice.all.where(user: 1)
    check = user_positions.map do |position|
      position.choice
    end
    if check.sort.uniq == [1, 2, 3] || check.sort.uniq == [1, 4, 7] || check.sort.uniq == [1, 5, 9] || check.sort.uniq == [2,5,8] || check.sort == [3,6,9]
      @match.winner = "You win"
      @match.save!
    else
      computer_choice = (@board - check).sample
      @computer_choice = UserChoice.create(choice: computer_choice, user: 0, match: @match)
      computer_positions = UserChoice.all.where(user: 0)
      check_computer = computer_positions.map do |position|
        position.choice
      end
      if check_computer.sort.uniq == [1, 2, 3] || check_computer.sort.uniq == [1, 4, 7] || check_computer.sort == [1, 5, 9] || check_computer.sort == [2,5,8] || check_computer.sort == [3,6,9]
        @match.winner = "You lost"
        @match.save!
      end
    end
    redirect_to match_user_choices_path(@match)
  end
end
