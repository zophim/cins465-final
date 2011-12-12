class OpsController < ApplicationController
  # GET /ops
  # GET /ops.json
  def index
    @ops = Op.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ops }
    end
  end

  # GET /ops/1
  # GET /ops/1.json
  def show
    @op = Op.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @op }
    end
  end

  # GET /ops/new
  # GET /ops/new.json
  def new
    @op = Op.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @op }
    end
  end

  # GET /ops/1/edit
  def edit
    @op = Op.find(params[:id])
  end

  # POST /ops
  # POST /ops.json
  def create
    @op = Op.new(params[:op])

    respond_to do |format|
      if @op.save
        format.html { redirect_to @op, notice: 'Op was successfully created.' }
        format.json { render json: @op, status: :created, location: @op }
      else
        format.html { render action: "new" }
        format.json { render json: @op.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ops/1
  # PUT /ops/1.json
  def update
    @op = Op.find(params[:id])

    respond_to do |format|
      if @op.update_attributes(params[:op])
        format.html { redirect_to @op, notice: 'Op was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @op.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ops/1
  # DELETE /ops/1.json
  def destroy
    @op = Op.find(params[:id])
    @op.destroy

    respond_to do |format|
      format.html { redirect_to ops_url }
      format.json { head :ok }
    end
  end
end
