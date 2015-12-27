class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update, :destroy]

  # GET /haikus
  # GET /haikus.json
  def index
    @haikus = Haiku.top4
  end

  def comparison
    haikus = Haiku.get_two_random_haikus
    @haiku1 = haikus[0]
    @haiku2 = haikus[1]
  end


  # GET /haikus/new
  def new
    @haiku = Haiku.new
  end


  # POST /haikus
  # POST /haikus.json
  def create
    @haiku = Haiku.new(haiku_params)

    respond_to do |format|
      if @haiku.save
        Haiku.make_from_gem
        format.html { redirect_to haikus_path, notice: 'Haiku was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  # def update
  #   binding.pry
  #   @haiku.like
  #   redirect_to comparison_path
  # end

  # DELETE /haikus/1
  # DELETE /haikus/1.json
  # def destroy
  #   @haiku.destroy
  #   respond_to do |format|
  #     format.html { redirect_to haikus_url, notice: 'Haiku was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
