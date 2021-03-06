class CharactersController < ApplicationController

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @play = Play.find(params[:play_id])
    @character = @play.characters.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @play = Play.find(params[:play_id])
    @character = Character.find(params[:id])
  end

  # POST /characters
  # POST /characters.json
  def create
    @play = Play.find(params[:play_id])
    @character = Character.new(params[:character])
    @character.play = @play

    respond_to do |format|
      if @character.save
        format.html { redirect_to edit_play_url(@play), notice: 'Character was successfully created.' }
        format.json { render json: @character, status: :created, location: @character }
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @play = Play.find(params[:play_id])
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to edit_play_url(@play), notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_play_url(@play) }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @play = Play.find(params[:play_id])
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to edit_play_url(@play) }
      format.json { head :no_content }
    end
  end
end
