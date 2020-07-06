class MatchesController < ApplicationController
  def new
    UserChoice.destroy_all
    @match = Match.new
    @match.user = current_user
    @match.save!
    redirect_to match_user_choices_path(@match)
  end
end
