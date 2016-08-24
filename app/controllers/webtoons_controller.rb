require 'open-uri'
require 'uri'

class WebtoonsController < ApplicationController
  before_action :set_webtoon, only: [:show, :edit, :update, :destroy]

  # GET /webtoons
  # GET /webtoons.json
 
  def index
    @webtoons = Webtoon.all 
      @webtoons.each do |f|
      page=Nokogiri::HTML(open f.url)
      sBringDay = page.css("td.num")[0].text
      sPreDay = page.css("td.num")[1].text

      f.bring_day=sBringDay
      f.pre_day=sPreDay


      if sBringDay !=nil
       if sPreDay.eql?(sBringDay)
         @notify=1
       else
          @notify=2
       end

       f.save
      end

    end
end


  # GET /webtoons/1
  # GET /webtoons/1.json
  def show
  end

  # GET /webtoons/new
  def new
    @webtoon = Webtoon.new
  end

  # GET /webtoons/1/edit
  def edit
  end

#  def compare
 #     @bring_day=page.css("table.viewList td")[5].text
 # end

  # POST /webtoons
  # POST /webtoons.json
  def create
    @webtoon = Webtoon.new(webtoon_params)

    respond_to do |format|
      if @webtoon.save
        format.html { redirect_to @webtoon, notice: 'Webtoon was successfully created.' }
        format.json { render :show, status: :created, location: @webtoon }
      else
        format.html { render :new }
        format.json { render json: @webtoon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webtoons/1
  # PATCH/PUT /webtoons/1.json
  def update
    respond_to do |format|
      if @webtoon.update(webtoon_params)
        format.html { redirect_to @webtoon, notice: 'Webtoon was successfully updated.' }
        format.json { render :show, status: :ok, location: @webtoon }
      else
        format.html { render :edit }
        format.json { render json: @webtoon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webtoons/1
  # DELETE /webtoons/1.json
  def destroy
    @webtoon.destroy
    respond_to do |format|
      format.html { redirect_to webtoons_url, notice: 'Webtoon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webtoon
      @webtoon = Webtoon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webtoon_params
      params.require(:webtoon).permit(:url, :pre_day,:bring_day,:wtname)
    end
end
