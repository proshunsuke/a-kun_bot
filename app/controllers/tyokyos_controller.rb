class TyokyosController < ApplicationController
  # GET /tyokyos
  # GET /tyokyos.json
  def index
    @tyokyos = Tyokyo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tyokyos }
    end
  end

  # GET /tyokyos/1
  # GET /tyokyos/1.json
  def show
    @tyokyo = Tyokyo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tyokyo }
    end
  end

  # GET /tyokyos/new
  # GET /tyokyos/new.json
  def new
    @tyokyo = Tyokyo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tyokyo }
    end
  end

  # GET /tyokyos/1/edit
  def edit
    @tyokyo = Tyokyo.find(params[:id])
  end

  # POST /tyokyos
  # POST /tyokyos.json
  def create
    @tyokyo = Tyokyo.new(params[:tyokyo])

    respond_to do |format|
      if @tyokyo.save
        format.html { redirect_to @tyokyo, :notice => 'Tyokyo was successfully created.' }
        format.json { render :json => @tyokyo, :status => :created, :location => @tyokyo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tyokyo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tyokyos/1
  # PUT /tyokyos/1.json
  def update
    @tyokyo = Tyokyo.find(params[:id])

    respond_to do |format|
      if @tyokyo.update_attributes(params[:tyokyo])
        format.html { redirect_to @tyokyo, :notice => 'Tyokyo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tyokyo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tyokyos/1
  # DELETE /tyokyos/1.json
  def destroy
    @tyokyo = Tyokyo.find(params[:id])
    @tyokyo.destroy

    respond_to do |format|
      format.html { redirect_to tyokyos_url }
      format.json { head :no_content }
    end
  end

  def tweet_tyokyo
    require 'rubygems'
    require "twitter"

    Twitter.configure do |cnf|
      cnf.consumer_key = "kFAJrOKDWDH7nRVC5XBO2A"
      cnf.consumer_secret = "EcGevWB37RRWJ7icLYpEmMOShgMIatHF2EjQQA6N1w"
      cnf.oauth_token = "1287046849-gf3LBk9wIh297961rtnYjCxoX9hZEzrgFzamN8C"
      cnf.oauth_token_secret = "t7NDNy1qXutDwFTKnBby9kIibK89XVA6S1baX8GVII"
    end

    # @msg = "Heloo World2"
    @tyokyos = Tyokyo.all

    select_index = rand(@tyokyos.length);
    @tyokyos.each_with_index do |tyokyo,i|
      if i == select_index then
        @msg_before = tyokyo.before
        @msg_after = tyokyo.after
      end
    end

    # # ここからテスト
    # @msg_before = "test"
    # @msg_after = "tweet"

    Twitter.update(@msg_before+" : "+@msg_after)


    respond_to do |format|
      format.html { render :action => "tweet_tyokyo" }
      format.json { render :json => @msg_before, :json => @msg_after }
    end

  end
end
