class RelationMastersController < ApplicationController
  before_action :set_relation_master, only: [:show, :edit, :update, :destroy]

  # GET /relation_masters
  # GET /relation_masters.json
  def index
    @relation_masters = RelationMaster.all
  end

  # GET /relation_masters/1
  # GET /relation_masters/1.json
  def show
  end

  # GET /relation_masters/new
  def new
    @relation_master = RelationMaster.new
  end

  # GET /relation_masters/1/edit
  def edit
  end

  # POST /relation_masters
  # POST /relation_masters.json
  def create
    @relation_master = RelationMaster.new(relation_master_params)

    respond_to do |format|
      if @relation_master.save
        format.html { redirect_to @relation_master, notice: 'Relation master was successfully created.' }
        format.json { render :show, status: :created, location: @relation_master }
      else
        format.html { render :new }
        format.json { render json: @relation_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relation_masters/1
  # PATCH/PUT /relation_masters/1.json
  def update
    respond_to do |format|
      if @relation_master.update(relation_master_params)
        format.html { redirect_to @relation_master, notice: 'Relation master was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation_master }
      else
        format.html { render :edit }
        format.json { render json: @relation_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relation_masters/1
  # DELETE /relation_masters/1.json
  def destroy
    @relation_master.destroy
    respond_to do |format|
      format.html { redirect_to relation_masters_url, notice: 'Relation master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation_master
      @relation_master = RelationMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_master_params
      params.require(:relation_master).permit(:code, :name, :description)
    end
end
