class DistrosController < ApplicationController
  before_action :set_distro, only: [:show, :edit, :update, :destroy, :cook]

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_distro
    if params[:name]
      @distro = Distro.where(:name => params[:name]).first
    else
      @distro = Distro.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def distro_params
    params.require(:distro).permit(:name, :info, :valid)
  end

  public
  # GET / (root, first time)
  def intro
    redirect_to :controller => 'distros', :action => 'index'
  end

  # GET /distros
  # GET /distros.json
  def index
    @distros = Distro.all
  end

  def cook
    #@distro = Distro.new(distro_params)
    respond_to do |format|
      # 423 - Resource locked
      #format.html { render action: 'cook', status: :locked }
      format.html { render :nothing => true, status: :locked }
      format.json { render action: 'cook', status: :cooking, location: @distro }
    end
  end

  # GET /distros/1
  # GET /distros/1.json
  def show
  end

  # GET /distros/new
  def new
    @distro = Distro.new
  end

  # GET /distros/1/edit
  def edit
  end

  # POST /distros
  # POST /distros.json
  def create
    @distro = Distro.new(distro_params)

    respond_to do |format|
      if @distro.save
        format.html { redirect_to @distro, notice: 'Distro was successfully created.' }
        format.json { render action: 'show', status: :created, location: @distro }
      else
        format.html { render action: 'new' }
        format.json { render json: @distro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distros/1
  # PATCH/PUT /distros/1.json
  def update
    respond_to do |format|
      if @distro.update(distro_params)
        format.html { redirect_to @distro, notice: 'Distro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @distro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distros/1
  # DELETE /distros/1.json
  def destroy
    @distro.destroy
    respond_to do |format|
      format.html { redirect_to distros_url }
      format.json { head :no_content }
    end
  end


end
