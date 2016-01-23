class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update, :destroy]

  def index
    @haikus = Haiku.top4
  end

  def comparison
    @haikus = Haiku.get_two_random_haikus
    respond_to do |format|
      # binding.pry
      format.html
      format.json {render json: @haikus, root: false}
    end
  end

  def new
    @haiku = Haiku.new
  end


  # POST /haikus
  # POST /haikus.json
  def create
    user = current_user || User.find(2)
    @haiku = user.haikus.build(haiku_params)
    # @haiku = Haiku.new(haiku_params)
    respond_to do |format|
      if @haiku.save
        Haiku.make_from_gem
        format.html { redirect_to haikus_path, notice: 'Haiku was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_haiku
      @haiku = Haiku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def haiku_params
      params.require(:haiku).permit(:line1, :line2, :line3, :likes, :user_id)
    end

end
