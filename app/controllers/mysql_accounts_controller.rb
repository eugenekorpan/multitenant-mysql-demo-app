class MysqlAccountsController < ApplicationController
  # GET /mysql_accounts
  # GET /mysql_accounts.json
  def index
    @mysql_accounts = MysqlAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mysql_accounts }
    end
  end

  # GET /mysql_accounts/1
  # GET /mysql_accounts/1.json
  def show
    @mysql_account = MysqlAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mysql_account }
    end
  end

  # GET /mysql_accounts/new
  # GET /mysql_accounts/new.json
  def new
    @mysql_account = MysqlAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mysql_account }
    end
  end

  # GET /mysql_accounts/1/edit
  def edit
    @mysql_account = MysqlAccount.find(params[:id])
  end

  # POST /mysql_accounts
  # POST /mysql_accounts.json
  def create
    @mysql_account = MysqlAccount.new(params[:mysql_account])

    respond_to do |format|
      if @mysql_account.save
        format.html { redirect_to @mysql_account, notice: 'Mysql account was successfully created.' }
        format.json { render json: @mysql_account, status: :created, location: @mysql_account }
      else
        format.html { render action: "new" }
        format.json { render json: @mysql_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mysql_accounts/1
  # PUT /mysql_accounts/1.json
  def update
    @mysql_account = MysqlAccount.find(params[:id])

    respond_to do |format|
      if @mysql_account.update_attributes(params[:mysql_account])
        format.html { redirect_to @mysql_account, notice: 'Mysql account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mysql_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mysql_accounts/1
  # DELETE /mysql_accounts/1.json
  def destroy
    @mysql_account = MysqlAccount.find(params[:id])
    @mysql_account.destroy

    respond_to do |format|
      format.html { redirect_to mysql_accounts_url }
      format.json { head :no_content }
    end
  end
end
